# Generated by Django 3.1.1 on 2020-09-22 05:49

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('authentication', '0009_remove_attendance_etat'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='attendance',
            name='absent',
        ),
        migrations.RemoveField(
            model_name='attendance',
            name='present',
        ),
        migrations.AlterField(
            model_name='horaire',
            name='debut_cour',
            field=models.TimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='horaire',
            name='fin_cour',
            field=models.TimeField(auto_now_add=True),
        ),
        migrations.CreateModel(
            name='Absence',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_absence', models.DateField(auto_now_add=True)),
                ('timesign', models.TimeField(auto_now_add=True)),
                ('justificatif', models.CharField(max_length=256, null=True)),
                ('student', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='authentication.students')),
            ],
        ),
    ]
