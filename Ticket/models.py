from django.db import models
from django.contrib.auth.models import User

# Model od Ticket App
class Urgency(models.Model):    
    name = models.CharField(max_length=100)    
    description = models.CharField(max_length=500)
    active = models.BooleanField(default=True)
    created = models.DateTimeField()

class Type(models.Model):    
    name = models.CharField(max_length=100)    
    description = models.CharField(max_length=500)
    active = models.BooleanField(default=True)
    created = models.DateTimeField()

class Status(models.Model):    
    name = models.CharField(max_length=100)    
    description = models.CharField(max_length=500)
    active = models.BooleanField(default=True)
    created = models.DateTimeField()


class Ticket(models.Model):    
    name = models.CharField(max_length=255)
    email = models.CharField(max_length=255)
    subject = models.CharField(max_length=255)
    active = models.BooleanField(default=True)
    urgency = models.ForeignKey(Urgency)
    tickettype = models.ForeignKey(Type)
    status = models.ForeignKey(Status)
    user = models.ForeignKey(User,null=True)
    message = models.TextField()
    created = models.DateTimeField()
    updated = models.DateTimeField()


class Comment(models.Model):        
    user = models.ForeignKey(User)
    tickets = models.ForeignKey(Ticket)  
    active = models.BooleanField(default=True)  
    comment = models.TextField()
    created = models.DateTimeField()
    updated = models.DateTimeField()