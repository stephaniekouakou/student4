from authentication.models import Students
from authentication.models import Attendance
from authentication.models import Photo
from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect
from django.views.generic import View

# Create your views here.

class Home(View):
    def get(self, request):
        return render(request, 'space/home.html')
