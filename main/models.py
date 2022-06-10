from django.db import models
from multiselectfield import MultiSelectField
from django.contrib.auth.models import User
from django.conf import settings
from .models import *
from django.dispatch import receiver #add this
from django.db.models.signals import post_save #add this

#DataFlair Models

        
class Patient(models.Model):
    name = models.CharField(max_length=50)
    phone_num = models.CharField(max_length=15)
    patient_relative_name = models.CharField(max_length=50, null=True)
    patient_relative_contact = models.CharField(max_length=15, null=True)
    address = models.TextField()
    SYMPTOMS = (
        ('Fever', 'Fever'),
        ('Dry cough', 'Dry cough'),
        ('Tiredness', 'Tiredness'),
        ('Aches and pains', 'Aches and pains'),
        ('Sore throat', 'Sore throat'),
        ('Diarrhoea', 'Diarrhoea'),
        ('Loss of taste or smell', 'Loss of taste or smell'),
        ('Difficulty in breathing or shortness of breath', 'Difficulty in breathing or shortness of breath'),
        ('Chest pain or pressure', 'Chest pain or pressure'),
        ('Loss of speech or movement', 'Loss of speech or movement'),
    )

    symptoms = MultiSelectField(choices=SYMPTOMS, null=True)
    prior_ailments = models.TextField()
    bed_num = models.ForeignKey("Bed", on_delete=models.CASCADE)
    dob = models.DateField(null=True)
    doctor = models.ForeignKey("Doctor", on_delete=models.CASCADE, null=True)
    doctors_notes = models.TextField(null=True, blank=True)
    doctors_visiting_time = models.CharField(null=True, max_length=50, blank=True)
    status = models.CharField(max_length=50)
    latitude=models.CharField(max_length = 20)
    lantitude=models.CharField(max_length = 20)
    loggeduser=models.CharField(max_length = 50)
    def __str__(self):
        return self.name
        
class Bed(models.Model):
    bed_number = models.CharField(max_length=50)
    occupied = models.BooleanField()
    def __str__(self):
        return self.bed_number

class Appointment(models.Model):
    covid_type= 'Type'
    covid_test= 'Covid-19 Test'
    covid_vaccination = 'Covid-19 Vaccination'
    status_CHOICES = [
        (covid_type, 'Type'),
        (covid_test, 'Covid-19 Test'),
        (covid_vaccination, 'Covid-19 Vaccination'),
       
    ]
    Type = models.CharField(
        max_length=50,
        choices=status_CHOICES,
        default=covid_type)
    Patientname=models.CharField(max_length = 20)
    Contactno=models.CharField(max_length = 10)
    Appointmentdate = models.DateField()
    Time = models.TimeField(default='HH:MM')
    Aadharno=models.CharField(max_length = 12)
    pending = 'Pending'
    booked = 'Booked'
    rejected = 'Rejected'
    waiting = 'Waiting for covid test'
    waitingvaccine = 'Waitinglist for vaccine'
    dose1= 'Covid-19 vaccined Dose 1'
    dose2= 'Covid-19 vaccined Dose 2'
    covidpos = 'Covid-19 +ve'
    covidneg = 'Covid-19 -ve'
    others='Others'
    status_CHOICES = [
       (pending, 'Pending'),
       (booked, 'Booked'),
       (rejected, 'Rejected'),
       (waiting, 'Waiting for covid test'),
       (waitingvaccine, 'Waiting list for vaccine'),
       (dose1, 'Covid-19 vaccined Dose 1'),
       (dose2, 'Covid-19 vaccined Dose 2'),
       (covidpos, 'Covid-19 +ve'),
       (covidneg, 'Covid-19 -ve'), 
       (others, 'Others'),       
    ]
   
    status = models.CharField(
        max_length=50,
        choices=status_CHOICES,
        default=pending)
    notes= models.CharField(max_length = 50)
    
    loggeduser=models.CharField(max_length = 50)
    
    
    def __unicode__(self):
        return self
class Doctor(models.Model):
    name = models.CharField(max_length=100)
    def __str__(self):
        return self.name


class Contacts(models.Model):

    phone_number = models.CharField(max_length=10)
    email_id=models.CharField(max_length=250)
    p_id=models.ForeignKey(Patient,on_delete=models.CASCADE)
    contactcreateuser=models.CharField(max_length = 50)

    
class Profile(models.Model):

    user    = models.OneToOneField(User, on_delete=models.CASCADE)
    
   

    
@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)

@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
		instance.profile.save()
        

