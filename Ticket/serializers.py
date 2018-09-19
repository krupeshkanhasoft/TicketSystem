from rest_framework import serializers

from Ticket.models import Urgency,Type,Status,Ticket,Comment
from django.contrib.auth.models import User
from rest_framework.serializers import (
   ModelSerializer,
   SerializerMethodField,
)

from django.core.serializers import serialize
# Seralizer of ticket App

# User seralizer
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = [
            'id',
            'username',
            'email'
            
        ]
# Urgency seralizer
class UrgencySerializer(serializers.ModelSerializer):
    class Meta:
        model = Urgency
        fields = [
            'id',
            'name',
            
        ]
# Status seralizer
class StatusSerializer(serializers.ModelSerializer):
    class Meta:
        model = Type
        fields = [
            'id',
            'name',
            
        ]
# Type seralizer
class TypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Status
        fields = [
            'id',
            'name',
            
        ]
# Comment seralizer
class CommentSerializer(serializers.ModelSerializer):
    user = UserSerializer()
    class Meta:
        model = Comment
        fields = [ 
            'user',
            'comment' 
        ]

# Ticket seralizer,I have also added comment seralizer inside ticket seralizer so that in one api we can get data comment model as well as user model
class TicketSerializer(serializers.ModelSerializer):
    urgency = UrgencySerializer()
    tickettype = TypeSerializer()
    status = StatusSerializer()
    comment = serializers.SerializerMethodField()

    serializer_ticket_class = CommentSerializer
    def get_comment(self,obj):
     
        client = Comment.objects.filter(tickets = obj.id)  
        data = self.serializer_ticket_class(client, many=True)    
        return data.data 

    class Meta:
        model = Ticket
        fields = [
            'id',
            'name',
            'email',
            'subject',
            'active',
            'urgency',
            'tickettype',
            'status',
            'message',
            'comment' 
        ]