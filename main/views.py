
from django.shortcuts import render, redirect
from django.http import JsonResponse
from .models import *
from .filters import PatientFilter
from django.contrib.auth.models import auth
from django.contrib import messages
from django.conf import settings
from django.http import HttpResponse
from twilio.rest import Client
from django.contrib.auth.decorators import login_required
from .forms import MapCreate,ContactCreate,ContactUpdate,AppointmentCreate
# PatientFilter = OrderFilter
import main.sendmail as sm


# Create your vie
def user_signup(request):
    if request.method == "POST":
        if request.POST['password1'] == request.POST['password2']:
            try:
                User.objects.get(username = request.POST['username'])
                
                return render (request,'main/user_register.html', {'error':'Username is already taken!'})
            except User.DoesNotExist:
                user = User.objects.create_user(request.POST['username'],password=request.POST['password1'],email=request.POST['email'],first_name=request.POST['first_name'],last_name=request.POST['last_name'])
                auth.login(request,user)
                return redirect('user_login')
        else:
            return render (request,'main/user_register.html', {'error':'Password does not match!'})
    else:
        return render(request,'main/user_register.html')
      
def user_login(request):
    if request.method == 'POST':
        user = auth.authenticate(username=request.POST['username'],password = request.POST['password'])
        if user is not None:
            auth.login(request,user)
            return redirect('user_home')
        else:
            return render (request,'main/user_login.html', {'error':'Username or password is incorrect!'})
    else:
    
        return render(request,'main/user_login.html')
        
def createappointment(request):  
    
    
    upload_form = AppointmentCreate(initial={'loggeduser': request.user.username})
    
    if request.method == 'POST':
       
        upload_form = AppointmentCreate(request.POST, request.FILES)
            
        if upload_form.is_valid():
            new_author = upload_form.save(commit=False)
            
            new_author.save()
            
            return redirect('myappointment')
        else:
            return HttpResponse("""your form is wrong, reload on <a href = "{{ url : 'index'}}">reload</a>""")
    
     
        
            
    else:
            return render(request, 'main/upload_data.html',{'upload_form':upload_form})
    
    
def myappointment(request):
    getdetails = Appointment.objects.filter(loggeduser=request.user.username).order_by('-id')
    if not getdetails:
       return render (request,'main/my_appointment_details.html', {'error':'there is no data'})
    
    else :
       
         return render(request, 'main/my_appointment_details.html', {'getdetails': getdetails})
        
 
def login(request):
    if request.user.is_authenticated:
        return redirect('/')
    else:
        if request.method == 'POST':
            username = request.POST['username']
            password = request.POST['password']
            user = auth.authenticate(username=username, password=password)
            if user is not None:
                auth.login(request, user)
                return redirect('/')
            else:
                messages.error(request, 'Invalid username or password')
                return redirect('login')
        else:
            return render(request, 'main/login.html')


@login_required(login_url='login')
def logout(request):
    auth.logout(request)
    return redirect('/')




def dashboard(request):
    patients = Patient.objects.all()
    patient_count = patients.count()
    patients_recovered = Patient.objects.filter(status="Recovered")
    patients_deceased = Patient.objects.filter(status="Deceased")
    deceased_count = patients_deceased.count()
    recovered_count = patients_recovered.count()
    beds = Bed.objects.all()
    beds_available = Bed.objects.filter(occupied=False).count()
    context = {
        'patient_count': patient_count,
        'recovered_count': recovered_count,
        'beds_available': beds_available,
        'deceased_count':deceased_count,
        'beds':beds
    }
    print(patient_count)
    return render(request, 'main/dashboard.html', context)

def add_patient(request):
    beds = Bed.objects.filter(occupied=False)
    doctors = Doctor.objects.all()
    if request.method == "POST":
        name = request.POST['name']
        phone_num = request.POST['phone_num']
        patient_relative_name = request.POST['patient_relative_name']
        patient_relative_contact = request.POST['patient_relative_contact']
        address = request.POST['address']
        symptoms = request.POST['symptoms']
        prior_ailments = request.POST['prior_ailments']
        bed_num_sent = request.POST['bed_num']
        bed_num = Bed.objects.get(bed_number=bed_num_sent)
        dob = request.POST['dob']
        status = request.POST['status']
        doctor = request.POST['doctor']
        doctor = Doctor.objects.get(name=doctor)
        print(request.POST)
        patient = Patient.objects.create(
            name = name,
        phone_num = phone_num,
        patient_relative_name = patient_relative_name,
        patient_relative_contact = patient_relative_contact, 
        address = address, 
        symptoms = symptoms, 
        prior_ailments = prior_ailments, 
        bed_num = bed_num,
        dob = dob, 
        doctor=doctor,
        loggeduser=request.user.username,
        status = status
        )
        patient.save()

        bed = Bed.objects.get(bed_number=bed_num_sent)
        bed.occupied = True
        bed.save()
        id = patient.id
        return redirect(f"/patient/{id}")
        
    context = {
        'beds': beds,
        'doctors': doctors
    }
    return render(request, 'main/add_patient.html', context)
def add_contact(request):
   
  
    doctors = Patient.objects.filter(loggeduser=request.user.username)
    if request.method == "POST":
        
        phone_number = request.POST['phone_number']
        email_id = request.POST['email_id']
       
        p_id = request.POST['p_id']
        p_id = Patient.objects.get(name=p_id)
        print(request.POST)
        contact = Contacts.objects.create(
        contactcreateuser=request.user.username,
        phone_number = phone_number,
        email_id = email_id,
       
        p_id=p_id,
       
        )
        contact.save()

        
        return redirect("contact_list")
        
    context = {
      
       'doctors': doctors
    }
    return render(request, 'main/add_contact.html', context)
   
def patient(request, pk):
    patient = Patient.objects.get(id=pk)
    if request.method == "POST":
        doctor = request.POST['doctor']
        doctor_time = request.POST['doctor_time']
        doctor_notes = request.POST['doctor_notes']
        mobile = request.POST['mobile']
        mobile2 = request.POST['mobile2']
        relativeName = request.POST['relativeName']
        address  = request.POST['location']
        print(doctor_time)
        print(doctor_notes)
        status = request.POST['status']
        doctor = Doctor.objects.get(name=doctor)
        print(doctor)
        patient.phone_num = mobile
        patient.patient_relative_contact = mobile2
        patient.patient_relative_name = relativeName
        patient.address = address
        patient.doctor = doctor
        patient.doctors_visiting_time = doctor_time
        patient.doctors_notes = doctor_notes
        print(patient.doctors_visiting_time)
        print(patient.doctors_notes)
        patient.status = status
        patient.save()
    context = {
        'patient': patient
    }
    return render(request, 'main/patient.html', context)


def patient_list(request):
    patients = Patient.objects.all()
    # filtering
    myFilter = PatientFilter(request.GET, queryset=patients)

    patients = myFilter.qs
    context = {
        'patients': patients,
        'myFilter': myFilter
    }

    return render(request, 'main/patient_list.html', context)

   

def getgeo(request):
        map_form = MapCreate()
        sel = Patient.objects.get(id =request.COOKIES['com_id'])
        if request.method == "POST":
           map_form = MapCreate(request.POST or None, instance=sel)    
          
           if map_form.is_valid():
              new_author = map_form.save(commit=False)
              new_author.latitude=request.COOKIES['latitude']
              new_author.lantitude=request.COOKIES['lantitude']
              new_author.save()
           return redirect('patient_list')
        else:
           return render(request, 'main/get_geolocation.html', {'map_form':map_form})      
           
def showgeo(request,com_id):
    com_id = int(com_id)
    showgeo = Patient.objects.get(id = com_id)
    showlat=request.COOKIES['showlat']
    showlan=request.COOKIES['showlan']
    context = {"showgeo":showgeo, 
		"showlat": showlat,"showlan": showlan}
    return render(request, 'main/show_geolocation.html', context) 
                  
'''
def autocomplete(request):
    if patient in request.GET:
        name = Patient.objects.filter(name__icontains=request.GET.get(patient))
        name = ['js', 'python']
        
        names = list()
        names.append('Shyren')
        print(names)
        for patient_name in name:
            names.append(patient_name.name)
        return JsonResponse(names, safe=False)
    return render (request, 'main/patient_list.html')
'''

def autosuggest(request):
    query_original = request.GET.get('term')
    queryset = Patient.objects.filter(name__icontains=query_original)
    mylist = []
    mylist += [x.name for x in queryset]
    return JsonResponse(mylist, safe=False)

def autodoctor(request):
    query_original = request.GET.get('term')
    queryset = Doctor.objects.filter(name__icontains=query_original)
    mylist = []
    mylist += [x.name for x in queryset]
    return JsonResponse(mylist, safe=False)

def info(request):
    return render(request, "main/info.html")
""" def contact_list(request):-->
    cont=Patient.objects.filter(loggeduser=request.user.username).values()

    for obj in cont:
        get_details=Contacts.objects.filter(p_id_id=obj['id']).values()
        for n in get_details:
           cont_name=obj['name']
    context = {"cont_name":cont_name, "get_details":get_details
    }
    return render(request, 'main/contact_list.html',context)"""
    
def contact_list(request):
    return render(request,"main/contact_list.html")
def user_home(request):
    return render(request,"main/user_home.html")


def update_contact(request, con_id):
    con_id = int(con_id)
    try:
        con_sel = Contacts.objects.get(id = con_id)
    except Contacts.DoesNotExist:
        return redirect('index')    
    con_form = ContactUpdate(request.POST or None, instance = con_sel)
    if con_form.is_valid():
        con_form.save()
        return redirect('contact_list')
    return render(request, 'main/update_contact.html', {'upload_form':con_form})

    return render(request, 'main/update_contact.html')

def delete_contact(request, con_id):
    con_id = int(con_id)
    try:
        con_sel = Contacts.objects.get(id = con_id)
    except Contacts.DoesNotExist:
        return redirect('home')
    con_sel.delete()
    return redirect('contact_list')
def index(request):
    return render(request,"main/index.html")

def doctor_det(request):
    return render(request,"main/doctor_det.html")

def success(request):
    return render(request,"main/success.html")
def admin_portal(request):
    return render(request,"main/admin_portal.html")
def Mail(request):
    cont=Contacts.objects.all().values()

    for obj in cont:
        name=Patient.objects.filter(id=obj['p_id_id']).values()
        for n in name:
            print(obj['email_id'])
            sm.send_mail(obj['email_id'],n['name'])

    return render(request,'main/mailsent.html')


import main.sms as s
def sendSms(request):
    cont = Contacts.objects.all().values()

    for obj in cont:
        name = Patient.objects.filter(id=obj['p_id_id']).values()
    for n in name:
        print(obj['phone_number'])
        s.sendSms(obj['phone_number'])

    return render(request, 'main/sendsms.html')
