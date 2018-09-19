from django.contrib.auth.models import User
from django.test.client import Client
from rest_framework.test import APITestCase, APIClient
import json
import unittest

# test case for Users/Login app
class LoginTest(unittest.TestCase):
		
	 	
    def create_user(self):
        # self.create_company()
        # datau = {'username': 'jatin1','email':'berani@yahoo.in','password': 'asdas12@','first_name':'fffff','last_name':'lllll','id_type':'1','id_number':'2','uhr_user_type':'1','is_active':1,'company':[{"company_id":self.company_id_ex, "is_superuser":0, "user_role":[1], "user_permission":[], "user_group":[]}]}
        my_admin = User.objects.create_user('ketan@test.com', 'ketan@test.com', 'ketan')

    def test_login_email_wrong(self):
    	self.client = APIClient()

    	self.create_user()
    	data = {"asd": "asd"}
        response = self.client.post('/v1/users/checklogin/', data, format='json')       
        code = json.loads((response.content)).get('status')
        self.assertEquals(code, False)

    def test_login_email_required(self):
    	self.client = APIClient()    
    	data = {"emailuser": ""}
        response = self.client.post('/v1/users/checklogin/', data, format='json')        
        code = json.loads((response.content)).get('status')
        self.assertEquals(code, False)

    def test_login_password_required(self):
    	self.client = APIClient()    
    	data = {"emailuser": "asdasd","password":""}
        response = self.client.post('/v1/users/checklogin/', data, format='json')        
        code = json.loads((response.content)).get('status')
        self.assertEquals(code, False)

    def test_login_failed(self):
    	self.client = APIClient()    
    	data = {"emailuser": "asdasd","password":"asdasd"}
        response = self.client.post('/v1/users/checklogin/', data, format='json')        
        code = json.loads((response.content)).get('status')
        self.assertEquals(code, False)

    def test_login_success(self):
    	self.client = APIClient()    
    	data = {"emailuser": "ketan@test.com","password":"ketan"}
        response = self.client.post('/v1/users/checklogin/', data, format='json')        
        code = json.loads((response.content)).get('status')
        self.assertEquals(code, True)