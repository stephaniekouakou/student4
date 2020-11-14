from django.shortcuts import render,redirect
from django.http import HttpResponseRedirect
from django.views.generic import View
from django.contrib import messages
from validate_email import validate_email
from authentication.models import Students, Attendance, Horaire_cour, Photo
from django.db.models import Q
import time,cv2,datetime
import numpy as np
from django.urls import reverse
from passlib.hash import pbkdf2_sha256
from django.contrib.sessions.models import Session
import face_recognition
from pathlib import Path
from imutils import face_utils
import argparse
import imutils


# Create your views here.
class RegistrationView(View):
    def get(self,request):
        return render(request,'auth/register.html')
    def post(self,request):
         context={
             'data': request.POST,
             'has_error':False,
         }
         name = request.POST.get('name')
         email = request.POST.get('email')
         phone = request.POST.get('phone')
         genre = request.POST.get('genre')
         password = request.POST.get('password')
         password2 = request.POST.get('password2')

         if len(password) < 6:
            messages.add_message(request, messages.ERROR, ' mot de passe trop court')
            context['has_error'] = True

         if password != password2:
             messages.add_message(request, messages.ERROR, 'les mot de passe sont differents')
             context['has_error'] = True

         if not validate_email(email):
             messages.add_message(request, messages.ERROR,'veuillez fournir un email valide')
             context['has_error'] = True

         if Students.objects.filter(email=email).exists():
             messages.add_message(request, messages.ERROR, 'cet email existe deja')
             context['has_error'] = True

         if Students.objects.filter(phone=phone).exists():
             messages.add_message(request, messages.ERROR, 'cet numero exits deja')
             context['has_error'] = True

         if context['has_error']:
            return render(request, 'auth/register.html', context)
         password =pbkdf2_sha256.encrypt(password, rounds=12000,salt_size=32)
         createstudent = Students(name=name, email=email, motpasse=password, phone=phone, genre=genre)
         createstudent.save()
         #creation des sessions de letudiant
         request.session['id'] = createstudent.id
         return redirect('capture')

class LoginView(View):
    def get(self,request):
        return render(request,'auth/login.html')
        
    def post(self,request):
        context={
             'data':request.POST,
             'has_error':False
        }
        email = request.POST.get('email')
        password = request.POST.get('password')
        if email=='':
            messages.add_message(request, messages.ERROR,
                                 'Entrez vous email Svp!')
            context['has_error'] = True
            return render(request, 'auth/login.html', context)
        if password == '':
            messages.add_message(request, messages.ERROR,
                                 'Entrez votre mot de passe Svp!')
            context['has_error'] = True
            return render(request, 'auth/login.html', context)
            
        if Students.objects.filter(email = email).exists():

           student = Students.objects.filter(email=email)
           passw = student[0].motpasse

           if pbkdf2_sha256.verify(password, passw):
               #creation des sessions de letudiant
              request.session['logged_in'] = True
              request.session['email'] = student[0].email
              request.session['id_student'] = student[0].id
              request.session['name']=student[0].name

              #redirige la page vers la vue recognition
              return redirect('recognition')
           else:
               messages.add_message(request, messages.ERROR,
                                    'password invalid!')
               context['has_error'] = True
               return render(request,'auth/login.html',context)                     
        else:
            messages.add_message(request, messages.ERROR,
                                 'email ou password invalid!')
            context['has_error'] = True
            return render(request,'auth/login.html',context)
       

class SignView(View):
    def get(self, request):
        if request.session.has_key('logged_in'):
            email = request.session.has_key('email')
            return render(request, 'auth/sign.html')

        return redirect('login')    

class Capture(View):
    def get(self, request): 
        if request.session.has_key('id'):
            return render(request,'auth/capture.html')
        return redirect('login')
    def post(self, request):
        if request.POST:
            name = request.POST.get('id_student')
            cam = cv2.VideoCapture(0)
            cv2.namedWindow("photo")
            img_counter = 0
            while True:
                ret, frame = cam.read()
                if not ret:
                    print("failed to grab frame")
                    break               
                cv2.imshow("photo", frame)
                k = cv2.waitKey(1)
                    
                if k % 256 == 27:
                    # ESC pressed
                    print("Escape hit, closing...")
                    return render(request, 'auth/capture.html')
                    break
                elif k % 256 == 32:
                    # SPACE pressed
                    img_name = "student{}.png".format(name)
                    cv2.imwrite(
                    r'.\authentication\media\student'+name+'.png', frame)

                    print("{}".format(img_name))
                    img_counter += 1
                    break
            if Photo.objects.filter(photo=img_name).exists():
               Photo.objects.filter(student_id=name).update(photo=img_name)
             
            else:
                photoCreate = Photo.objects.create(
                    photo=img_name, student_id=name)
                photoCreate.save
            cam.release()
            cv2.destroyAllWindows() 
            messages.add_message(request, messages.SUCCESS,
                                 'Votre compte a été crée avec succes')
            return render(request, 'auth/capture.html', {'photocapture': Photo.objects.get(photo=img_name)})
        else:
            return render(request, 'auth/capture.html')


class Recognition(View):
    def get(self, request):       
        if request.session.has_key('logged_in'):
            return render(request, 'auth/recognition.html')
        return redirect('login') 

    def post(self, request):
       #je recuper le id et nom de letudiant grace la session
            id_user = request.POST.get('id_user')
            nom = request.POST.get('fullname')
            #recuperer la photo de letudiant enregistrer   dans la base de donnee lors de son inscription
            photoEtud = Photo.objects.filter(student_id=id_user)
            #recuperer aussi le nom de letudiant
            fullname = Students.objects.filter(id=id_user)
            #path de la photo correspondant dans mon projet
            p = Path('./authentication/media/'+str(photoEtud[0].photo))
            photo = p.name
            files_names = []
            # on sauvegarde le nom de l'image dns
            files_names.append(p.name)
            nomprenom = fullname[0].name
            #chargement de la webcam avec cv2
            video_capture = cv2.VideoCapture(0)
            #on recupere le visage a partir du path recuperer
            user_image = face_recognition.load_image_file(p)
            #encodage du visage sur la photo
            user_image_encoding = face_recognition.face_encodings(user_image)[
                                                                  0]
            # tableau des visages qu'on connait(elles serviront a la comparaison avec les img de la video)
            known_face_encodings = [
                user_image_encoding,
            ]
            #tableau de nom corespondant aux visage de letudiant connecter
            known_face_names = [
                nomprenom,

              ]
            #initialisations de nouveau tableaux ;pour stocker le(les) visage(s)  capturer par la video
            face_locations = []
            face_encodings = []
            face_names = []
            process_this_frame = True
            #le temps ;debut de la video je donne 20s pour fermer la webcam
            start_time = time.time()
            while True:
                #jouvre la webcam
                ret, frame = video_capture.read()
                # Resize frame of video to 1/4 size for faster face recognition processing
                small_frame = cv2.resize(frame, (0, 0), fx=0.25, fy=0.25)
                # Convert the image from BGR color (which OpenCV uses) to RGB color (which face_recognition uses)
                rgb_small_frame = small_frame[:, :, ::-1]
                if process_this_frame and time.time() - start_time >= 3:

                    #Trouvez tous les visages et encodages de visage dans l'image actuelle de la vidéo
                    face_locations = face_recognition.face_locations(
                        rgb_small_frame)
                    face_encodings = face_recognition.face_encodings(
                        rgb_small_frame, face_locations)

                    face_names = []  # tableau de nom il recupera soit le nom ou inconnu
                    matches='vide'
                    for face_encoding in face_encodings:
                        # comparaison de la photo quon connait a celle de limage de la video
                        matches = face_recognition.compare_faces(known_face_encodings,face_encoding,tolerance=0.4
                            )
                        #on considere quil na pas trouvé de visage alors name prends inconnu
                        name = 'Inconnu'
                        print(matches)
                        #sil a trouver le visage alors on recupere le nom, name change de valeur
                        if True in matches:
                            first_match_index = matches.index(True)
                            print(first_match_index)
                            name = known_face_names[first_match_index]
                        elif False in matches:
                            first_match_index = matches.index(False)
                            print(first_match_index)
                            name = "Inconnu"
                        elif not(matches):
                            name = "Inconnu"      
                        face_names.append(name)
                process_this_frame = not process_this_frame
                #affichage des resultats
                for (top, right, bottom, left), name in zip(face_locations, face_names):
                    # Scale back up face locations since the frame we detected in was scaled to 1/4 size
                    top *= 4
                    right *= 4
                    bottom *= 4
                    left *= 4

                    # on desine le rectangle autour du visage
                    cv2.rectangle(frame, (left, top),
                                  (right, bottom), (0, 0, 255), 2)

                    #Dessinez une étiquette avec un nom sous le visage
                    cv2.rectangle(frame, (left, bottom - 35),
                                  (right, bottom), (0, 0, 255), cv2.FILLED)
                    font = cv2.FONT_HERSHEY_DUPLEX
                    cv2.putText(frame, name, (left + 8, bottom - 8),
                                font, 1.0, (255, 255, 255), 2)

                # Display the resulting image
                cv2.imshow('Video', frame)

            # clique sur la touche q pour fermer la video ou a 20s la camera se ferme seule  !
                if cv2.waitKey(1) & 0xFF == ord('q') or time.time() - start_time >= 15:
                    break

                #print('Duration: {}'.format(time.time() - start_time))
            #Relâchez la poignée de la webcam
            video_capture.release()
            cv2.destroyAllWindows()
            print(face_names)
            if matches  == 'vide':
                messages.add_message(request, messages.INFO,
                                     'Aucun visage detecter')
                return redirect('recognition')
            if False in matches or face_names == '':
                messages.add_message(request, messages.INFO,
                                     'desolé vous navez pas ete reconnu')
                return redirect('recognition')
            if True in matches:
                #je recupere lheure actuelle
                datee = datetime.date.today()
                timee = datetime.datetime.now().time()
                #ajout de la table attendance
                print(timee)
                if Horaire_cour.objects.filter(date_cour=datee).exists():
                    cour = Horaire_cour.objects.filter(date_cour=datee)
                    debut=cour[0].debut_cour
                    fin =cour[0].fin_cour 
                    if timee < debut:
                        print("le cour na pas encore debuté,revenez signer dans quelques instant")
                    elif timee >= debut and timee <= fin :
                        signe = Attendance(
                            datesign=datee, timesign=timee, student_id=id_user, horaire_id=cour[0].id)
                        signe.save()
                        messages.add_message(request, messages.INFO,
                                      'vous venez de signez')
                        return redirect('sign')              
                    elif timee > fin:    
                        messages.add_message(request, messages.INFO,
                                      'vous avez ratez le cour')
                        return redirect('sign')  

                else:
                     messages.add_message(request, messages.INFO,
                                      'Pas de cour programé aujordhui')
                return redirect('sign')
        
            return render(request, 'auth/recognition.html')



class Absence(View):
    def get(self, request):
        count = Students.objects.all().count()

        for e in Students.objects.all():
             print(e.name)

        return render(request, 'space/home.html')
        
       
        


