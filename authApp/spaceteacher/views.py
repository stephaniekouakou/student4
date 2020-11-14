from django.shortcuts import render
# Create your views here.
from authentication.models import Students
from authentication.models import Attendance
from authentication.models import Teacher
from authentication.models import Photo
from authentication.models import Horaire_cour
from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect
from passlib.hash import pbkdf2_sha256
from django.contrib import messages
from django.views.generic import View

# Create your views here.


class Home(View):
    def get(self, request):
        if request.session.has_key('logged_in'):
            return render(request, 'teacher/home.html')
        else:
            return redirect('loginteacher')



class Horaire(View):
    def get(self, request):
        return render(request, 'teacher/horaire.html')

    def post(self, request):
            if request.POST.get('register'):
                context = {
                    'data': request.POST,
                    'has_error': False,
                    }
                datecour = request.POST.get('date_cour')
                debutcour = request.POST.get('debutcour')
                fincour = request.POST.get('fincour')
                id_teacher = request.session.has_key('id_teacher')
                print(datecour) 
                print(debutcour)
                print(fincour)
                if datecour =="" or debutcour == "" or fincour=="":
                    messages.add_message(request, messages.INFO,
                                         'Remplissez touts les champs svp')
                    return render(request, 'teacher/horaire.html', context)
                else:
                    horaire = Horaire_cour.objects.create(
                        debut_cour=debutcour, fin_cour=fincour, date_cour=datecour, teacher_id=id_teacher)
                    horaire.save
                    messages.add_message(request, messages.SUCCESS,
                                        'ajout effectuer avec succes')
                    return render(request, 'teacher/horaire.html',context)


class LoginTeacher(View):
    def get(self, request):
        return render(request, 'teacher/login_teacher.html')

    def post(self, request):
        context = {
            'data': request.POST,
            'has_error': False
        }
        email = request.POST.get('email')
        password = request.POST.get('password')
        if email == '':
            messages.add_message(request, messages.ERROR,
                                     'Entrez votre email Svp!')

            context['has_error'] = True
            return render(request, 'teacher/login_teacher.html', context)

        if password == '':
            messages.add_message(request, messages.ERROR,
                                 'Entrez votre mot de passe Svp!')
            context['has_error'] = True
            return render(request, 'auth/login.html', context)

        if Teacher.objects.filter(email=email).exists():

            teacher = Teacher.objects.filter(email=email)
            passw = teacher[0].motpasse

            if pbkdf2_sha256.verify(password, passw):
                print(passw)
                #creation des sessions de letudiant
                request.session['logged_in'] = True
                request.session['id_teacher'] = teacher[0].id
                request.session['nom'] = teacher[0].nom

                #redirige la page vers la vue recognition
                return redirect('hometeacher')
            else:
                messages.add_message(request, messages.ERROR,
                                             'password invalid!')
                context['has_error'] = True
                return render(request, 'teacher/login_teacher.html', context)
        else:
            messages.add_message(request, messages.ERROR,
                                 'email ou password invalid!')
            context['has_error'] = True
            return render(request, 'teacher/login_teacher.html', context)
        
        
def Logout(request):
    try:
        del request.session['logged_in']
        del request.session['id_teacher']
        del request.session['nom']
    except KeyError:
        return redirect('login')
    return render(request, 'pages/home.html')
