from django.conf.urls import url
from django.urls import path
from . import views
from .views import autosuggest

urlpatterns = [
    # path("", views.index, name="index"),
    path("", views.index, name="index"),
    path('user_register/', views.user_signup, name="user_signup"),
	path('user_login/', views.user_login, name="user_login"),  
    path("dashboard", views.dashboard, name="dashboard"),
    path("login/", views.login, name="login"),
    path('logout', views.logout, name='logout'),
    path('user_home', views.user_home, name='user_home'),
    
    path('createappointment/', views.createappointment, name = 'upload-appointment'),
    path('myappointment/', views.myappointment, name='myappointment'),
    path("add_patient/", views.add_patient, name="add_patient"),
    path("add_contact/", views.add_contact, name="add_contact"),
    path("patient_list/", views.patient_list, name="patient_list"),
    path('patient_list/getgeo/', views.getgeo, name="getgeo"),
    path('patient_list/showgeo/<int:com_id>', views.showgeo, name='showgeo'),
    
    path("patient/<str:pk>", views.patient, name="patient"),
    path("autosuggest/", views.autosuggest, name="autosuggest"),
    path("autodoctor/", views.autodoctor, name="autodoctor"),
    path("info/", views.info, name="info"),
    path("contact_list/",views.contact_list,name = "contact_list"),
    path('contact_list/update/<int:con_id>', views.update_contact),
	path('contact_list/delete/<int:con_id>', views.delete_contact),
    path("doctor_det/",views.doctor_det,name = "doctor_det"),
  
    path("success/",views.success,name="success"),
    path("admin_portal/",views.admin_portal,name = "admin_portal"),
    path("mailsent/",views.Mail,name='sendmail'),
    path("sendsms/",views.sendSms, name='sendsms'),



]
