
from django.conf.urls.static import static
from . import views
from django.urls import path

urlpatterns = [
    path('', views.Home.as_view(), name='hometeacher'),
    path('loginteacher', views.LoginTeacher.as_view(), name='loginteacher'),
    path('horaire', views.Horaire.as_view(), name='ajout_horaire'),
    path('logout', views.Logout, name='logout'),

]
