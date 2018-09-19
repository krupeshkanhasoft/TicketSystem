# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.test import TestCase
from django.utils import timezone
from django.contrib.auth.models import User
from django.test.client import Client
from Ticket.models import Urgency,Type,Status,Ticket,Comment
from rest_framework.test import APITestCase, APIClient
import json
import unittest

# Test cases of ticket ,here are only few test cases but we can create more test case 
class TicketTest(unittest.TestCase):
		
	 	
    def create_login_user(self):
        # self.create_company()
        # datau = {'username': 'jatin1','email':'berani@yahoo.in','password': 'asdas12@','first_name':'fffff','last_name':'lllll','id_type':'1','id_number':'2','uhr_user_type':'1','is_active':1,'company':[{"company_id":self.company_id_ex, "is_superuser":0, "user_role":[1], "user_permission":[], "user_group":[]}]}
        my_admin = User.objects.create_user('ketan1', 'ketan@test.com', 'ketan1')
        Urgencydata = Urgency.objects.create(name='Low',description='Low',active='True',created=timezone.now())
        Typedata = Type.objects.create(name='Bug Report',description='Bug Report',active=True,created=timezone.now())
        Statusdata = Status.objects.create(name='Open',description='Open',active=True,created=timezone.now())
        self.client = APIClient()
        data = {"emailuser": "ketan1","password":"ketan1"}
        response = self.client.post('/v1/users/checklogin/', data, format='json')        
        code = json.loads((response.content)).get('status')
        self.token = json.loads((response.content)).get('token')

    def test_create_ticket_failed(self):
    	self.create_login_user()   
    	data = {"name": "ketan","email":"ketan"}
        response = self.client.post('/v1/Tickets/CreateTicket/', data, format='json')       
        code = json.loads((response.content)).get('status')
        self.assertEquals(code, False)


    def test_create_ticket_success(self):  
     	self.client = APIClient()  
    	data = {"name": "ketan","email":"ketan@gmail.com","subject":"test","urgency":"1","type":"1","message":"Test"}
        response = self.client.post('/v1/Tickets/CreateTicket/', data, format='json')              
        code = json.loads((response.content)).get('status')
        self.assertEquals(code, True)

   