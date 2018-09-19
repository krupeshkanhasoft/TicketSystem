
from django.conf.urls import  include, url
from api import CheckLoginApi

# URLS for Users app
urlpatterns = [
   
    url(r'^checklogin/$', CheckLoginApi.as_view(), name='home2'),
 
    ]