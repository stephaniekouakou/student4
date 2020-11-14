from django.db import models
from django.forms import ModelForm
# Create your models here.

class Students(models.Model):
    name = models.CharField(max_length=250)
    email = models.EmailField(max_length=100)
    motpasse = models.CharField(max_length=256)
    phone = models.IntegerField(default=0)
    genre = models.CharField(max_length=50)
    date_created = models.DateTimeField(auto_now_add=True)
class Meta:
    db_table = "students"


class Photo(models.Model):
    photo = models.ImageField()
    student = models.ForeignKey(Students, on_delete=models.CASCADE)


class Teacher(models.Model):
    nom = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    motpasse = models.CharField(max_length=100)

class Horaire_cour(models.Model):
    date_cour = models.DateField(auto_now_add=False)
    debut_cour = models.TimeField(auto_now_add=False)
    fin_cour = models.TimeField(auto_now_add=False)
    teacher = models.ForeignKey(Teacher, on_delete=models.CASCADE)
class Meta:
    db_table = "Horaire"


class Attendance(models.Model):
    datesign = models.DateField(auto_now_add=True)
    timesign = models.TimeField(auto_now_add=True)   
    student = models.ForeignKey(Students, on_delete=models.CASCADE)
    horaire = models.ForeignKey(Horaire_cour, on_delete=models.CASCADE)
 



    


