# Generated by Django 3.1.6 on 2022-06-04 11:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0008_remove_appointment_appointmentcreateuser'),
    ]

    operations = [
        migrations.AddField(
            model_name='contacts',
            name='contactcreateuser',
            field=models.CharField(default=1, max_length=50),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='patient',
            name='loggeduser',
            field=models.CharField(default=1, max_length=50),
            preserve_default=False,
        ),
    ]