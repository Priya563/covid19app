from django import forms
import hashlib
from hashlib import md5
from .models import  Patient,Bed,Doctor,Contacts,Appointment
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Submit
from django.forms import ModelForm
from django.contrib.auth.models import User
from django.contrib.auth import get_user_model

class DateInput(forms.DateInput):
    input_type = 'date'

class MapCreate(forms.ModelForm):
        
    class Meta:
             
           model = Patient
           
           fields = ('latitude','lantitude')
           
class ContactCreate(forms.ModelForm):
        
    class Meta:
             
           model = Contacts
           
           fields = ('phone_number','email_id', 'p_id')
           
class ContactUpdate(forms.ModelForm):
        
    class Meta:
             
           model = Contacts
           
           fields = ('phone_number','email_id')
           
             
class UserForm(forms.ModelForm):

     class Meta: 
            model = User
            fields = ('username','first_name', 'last_name', 'email')
     
class AppointmentCreate(forms.ModelForm):
  
    class Meta:
            model = Appointment
            fields=['Patientname','Contactno','Appointmentdate','Time', 'Type', 'Aadharno','loggeduser']
            widgets = {'loggeduser': forms.HiddenInput(),'status': forms.HiddenInput(),'notes': forms.HiddenInput(),'Appointmentdate': DateInput(),'Time':forms.TimeInput(format='%H:%M')}
