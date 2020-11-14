from django.urls import path
from . import views
from django.contrib.auth.decorators import login_required
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    path('',views.RegistrationView.as_view(),name='register'),
    path('login',views.LoginView.as_view(), name='login'),
    path('sign', views.SignView.as_view(), name='sign'),
    path('capture', views.Capture.as_view(), name='capture'),
    path('recognition', views.Recognition.as_view(), name='recognition'),
   
] 
