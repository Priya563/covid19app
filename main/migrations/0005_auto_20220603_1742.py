# Generated by Django 3.1.6 on 2022-06-03 12:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0004_delete_message'),
    ]

    operations = [
        migrations.AddField(
            model_name='patient',
            name='lantitude',
            field=models.CharField(default=1, max_length=20),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='patient',
            name='latitude',
            field=models.CharField(default=1, max_length=20),
            preserve_default=False,
        ),
    ]
