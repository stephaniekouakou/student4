from django.shortcuts import render


def home(request):
    return render(request, 'pages/home.html')


def Logout(request):
    try:
        del request.session['logged_in']
        del request.session['email'] 
        del request.session['id_student'] 
        del request.session['name'] 
    except KeyError:
         return redirect('login')
    return render(request, 'pages/home.html')
   
