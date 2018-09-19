
from rest_framework.authentication import TokenAuthentication
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from rest_framework.views import APIView
from django.contrib.auth.models import User
from django.core.mail import send_mail
from users.models import token
import uuid
from django.contrib.auth import authenticate
from django.utils.crypto import get_random_string
from django.contrib.auth.hashers import make_password
from django.utils import timezone
from django.db.models import Q
from django.db import connection
import collections
from common import CheckPermission,validateEmail
import sys

# This functions check required validations with login detail also user name and password
class CheckLoginApi(APIView):

    def post(self, request, **kwargs):
       
        try:
            data = request.data
            emailuser=  data.get("emailuser")
            password = data.get("password")


            if not emailuser:
                return Response({'status': False,'Message':"Email is required"})  

            if not validateEmail(emailuser):
                return Response({'status': False,'Message':"Email Format is wrong"}) 

            if not password:
                return Response({'status': False,'Message':"Password is required"})  

            user = authenticate(username=emailuser, password=password)         
            tokens = ""
            if user:
                Userdata = User.objects.filter(username=emailuser,is_active=True)
                if Userdata:                    
                        tokens = uuid.uuid4()
                        token.objects.create(user_id=Userdata[0].id,token=tokens,created=timezone.now())
                       
                        return Response({'status': True, 'token': tokens,'id': Userdata[0].id,'email': Userdata[0].email,'Message':"Login Successfully"})                   
                else:
                   
                    return Response( {'status': False,'Message':"you are not active,Please ask admin to active again "})
            else:
                
                return Response( {'status': False,'Message':'Username or password is wrong'})



        except Exception as e:           
            return Response( {'status': False,'Message':'something issue from our end will check it and get back to you'})





