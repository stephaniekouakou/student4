
from django.conf.urls.static import static
from . import views
from django.urls import path

urlpatterns = [
    path('', views.Home.as_view(), name='homestudent'),

]
