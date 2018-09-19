
from rest_framework.authentication import TokenAuthentication
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from rest_framework.views import APIView
from django.contrib.auth.models import User
from Ticket.models import Urgency,Type,Status,Ticket,Comment
from Ticket.serializers import UrgencySerializer,StatusSerializer,TypeSerializer,TicketSerializer
import uuid
from django.db.models import Q
from django.db import connection
import collections
from django.utils import timezone
from common import CheckPermission,validateEmail


# this functions is used for save ticket in database with necessary validations without login
class CreateTicket(APIView):

    def post(self, request, **kwargs):
        status = False
        try:
            data = request.data
            name=  data.get("name")
            email=  data.get("email")
            subject=  data.get("subject")
            urgency = data.get("urgency")
            type = data.get("type") 
            message = data.get("message")   

            if not name:
                return Response({'status': status,'Message':"Name is required"})  

            if not email:
                return Response({'status': status,'Message':"Email is required"})  

            if not validateEmail(email):
                return Response({'status': status,'Message':"Email Format is wrong"})  

            if not subject:
                return Response({'status': status,'Message':"subject is required"})  

            if not urgency:
                return Response({'status': status,'Message':"urgency is required"})

            if not type:
                return Response({'status': status,'Message':"type is required"})

            if not message:
                return Response({'status': status,'Message':"message is required"})

            p = Ticket.objects.create(name=name,email=email,subject=subject,urgency_id=urgency,tickettype_id=type,message=message,status_id=1,active=True,created=timezone.now(),updated=timezone.now())
            
            if p:
                status = True
            else:
                status = False


        except Exception as e:   
             
            return Response({'status': status,'Message':"Error in submatting ticket"})

        return Response({'status': status,'Message':"Ticket Saved Successfully"})


# this functions is used for save ticket in database with necessary validations with login
# CheckPermission class is used for user's have token or  not,valid token or not,expired or not
class CreateTicketAdmin(CheckPermission,APIView):

    def post(self, request, **kwargs):
        status = False
        try:
            data = request.data
            name=  data.get("name")
            email=  data.get("email")
            subject=  data.get("subject")
            urgency = data.get("urgency")
            type = data.get("type") 
            message = data.get("message")   

            if not name:
                return Response({'status': status,'Message':"Name is required"})  

            if not email:
                return Response({'status': status,'Message':"Email is required"})  

            if not validateEmail(email):
                return Response({'status': status,'Message':"Email Format is wrong"})  

            if not subject:
                return Response({'status': status,'Message':"subject is required"})  

            if not urgency:
                return Response({'status': status,'Message':"urgency is required"})

            if not type:
                return Response({'status': status,'Message':"type is required"})

            if not message:
                return Response({'status': status,'Message':"message is required"})

            p = Ticket.objects.create(name=name,email=email,subject=subject,urgency_id=urgency,tickettype_id=type,message=message,status_id=1,user_id=self.user_id,active=True,created=timezone.now(),updated=timezone.now())
           
            if p:
                status = True
            else:
                status = False


        except Exception as e:   
                  
            return Response({'status': status,'Message':"Error in submatting ticket"})

        return Response({'status': status,'Message':"Ticket Saved Successfully"})





# this functions is used for update ticket in database with necessary validations with login
class UpdateTicketCommentAdmin(CheckPermission,APIView):

    def post(self, request, **kwargs):
        status = False
        try:
            data = request.data
            commentid=  data.get("commentid")           
            comment = data.get("comment")   

            if not commentid:
                return Response({'status': status,'Message':"Comment ID is required"})  

            if not comment:
                return Response({'status': status,'Message':"comment is required"})  

            p = Comment.objects.filter(id=commentid).first()
            if p:
                p.comment = comment 
                p.user_id=self.user_id              
                p.updated = timezone.now()
                p.save()
                status = True
            else:
                status = False           

        except Exception as e:   
              
            return Response({'status': status,'Message':"Error in submatting comment"})

        return Response({'status': status,'Message':"Comment Saved Successfully"})


# this functions is used for delete ticket in database with necessary validations with login
class DeleteTicketCommentAdmin(CheckPermission,APIView):

    def post(self, request, **kwargs):
        status = False
        try:
            data = request.data
            commentid=  data.get("commentid")           
          

            if not commentid:
                return Response({'status': status,'Message':"Comment ID is required"})  

          

            p = Comment.objects.filter(id=commentid).first()
            if p:
                p.comment = comment 
                p.active=False
                p.user_id=self.user_id              
                p.updated = timezone.now()
                p.save()
                status = True
            else:
                status = False           

        except Exception as e:   
              
            return Response({'status': status,'Message':"Error in submatting comment"})

        return Response({'status': status,'Message':"Comment Saved Successfully"})


# this functions is used for create comment of ticket in database with necessary validations with login
class CreateTicketCommentAdmin(CheckPermission,APIView):

    def post(self, request, **kwargs):
        status = False
        try:
            data = request.data 
            ticketid=  data.get("ticketid")           
            comment = data.get("comment")   

            if not ticketid:
                return Response({'status': status,'Message':"Ticket ID is required"})  

            if not comment:
                return Response({'status': status,'Message':"comment is required"})  
 
            p = Comment.objects.create(comment=comment,tickets_id=ticketid,user_id=self.user_id,active=True,created=timezone.now(),updated=timezone.now())
           
            if p:
                status = True
            else:
                status = False


        except Exception as e:   
            return Response({'status': status,'Message':"Error in submatting comment"})

        return Response({'status': status,'Message':"Comment Saved Successfully"})

# this functions is used for update comment of ticket in database with necessary validations with login
class UpdateTicketAdmin(CheckPermission,APIView):

    def post(self, request, **kwargs):
        status = False
        try:
            data = request.data
         
            id=  data.get("id")
            name=  data.get("name")
            email=  data.get("email")
            subject=  data.get("subject")
            urgency = data.get("urgency")
            type = data.get("type") 
            stausd = data.get("status") 
            message = data.get("message")   

            if not id:
                return Response({'status': status,'Message':"Ticket id is required"}) 

            if not name:
                return Response({'status': status,'Message':"Name is required"})  

            if not email:
                return Response({'status': status,'Message':"Email is required"})  

            if not validateEmail(email):
                return Response({'status': status,'Message':"Email Format is wrong"})  

            if not subject:
                return Response({'status': status,'Message':"subject is required"})  

            if not urgency:
                return Response({'status': status,'Message':"urgency is required"})

            if not type:
                return Response({'status': status,'Message':"type is required"})

            if not stausd:
                return Response({'status': status,'Message':"staus is required"})

            if not message:
                return Response({'status': status,'Message':"message is required"})


            p = Ticket.objects.filter(id=id).first()
            if p:
                p.name = name
                p.email = email
                p.subject = subject
                p.message = message
                p.urgency_id = urgency
                p.tickettype_id = type
                p.status_id = stausd
                p.user_id = self.user_id
                p.active = True
                p.updated = timezone.now()
                p.save()
                status = True
            else:
                status = False                    


        except Exception as e:             
            return Response({'status': status,'Message':"Error in Updating ticket"})

        return Response({'status': status,'Message':"Ticket Updated Successfully"})

# this functions is used for delete comment of ticket in database with necessary validations with login
class DeleteTicketAdmin(CheckPermission,APIView):

    serializer_ticket_class = TicketSerializer

    def post(self, request, **kwargs):
        status = False
        sdata = None 
        try:
            data = request.data
            id=  data.get("id")
            

            if not id:
                return Response({'status': status,'Message':"Ticket id is required"}) 

            
            p = Ticket.objects.filter(id=id).first()
            if p:
               
                
                p.user_id = self.user_id
                p.active = False
                p.updated = timezone.now()
                p.save()
                status = True
                TicketData = Ticket.objects.filter(active=True)
                serialize_ticket = self.serializer_ticket_class(TicketData, many=True)
                sdata =  serialize_ticket.data
            else:
                status = False                    


        except Exception as e:               
            return Response({'status': status,'Message':"Error in Deleting ticket"})

        return Response({'status': status,'Message':"Ticket Deleted Successfully",'data': {'Ticket' : sdata}})


# this functions is used for update status of ticket in database with necessary validations with login
class UpdateTicketStatusAdmin(CheckPermission,APIView):
    serializer_ticket_class = TicketSerializer
    def post(self, request, **kwargs):
        status = False
        sdata = None 
        try:
            data = request.data
            id=  data.get("id")
           
            stausd = data.get("status") 
          
            if not id:
                return Response({'status': status,'Message':"Ticket id is required"}) 

           

            if not stausd:
                return Response({'status': status,'Message':"status is required"})

          

            p = Ticket.objects.filter(id=id).first()
            if p:
               
                p.status_id = stausd
                p.user_id = self.user_id               
                p.updated = timezone.now()
                p.save()
                status = True
                TicketData = Ticket.objects.filter(active=True)
                serialize_ticket = self.serializer_ticket_class(TicketData, many=True)
                sdata = serialize_ticket.data
            else:
                status = False                    


        except Exception as e:                 
            return Response({'status': status,'Message':"Error in Updating status of ticket"})

        return Response({'status': status,'Message':"Ticket's status Updated Successfully",'data': {'Ticket' : sdata}})


# this functions is used for retrive all detail of ticket in database with necessary validations with login
class GetAllTicketAdmin(CheckPermission,APIView):
    
    serializer_ticket_class = TicketSerializer


    def get(self, request, **kwargs):
        status = False
        try:
            
            TicketData = Ticket.objects.filter(active=True).order_by('id')
            serialize_ticket = self.serializer_ticket_class(TicketData, many=True) 
           

        except Exception as e:     
            
            return Response({'status': False,'Message':"Error in retriving ticket Data"})

        return Response({'status': True,'Message':"Here is master data",'data': {'Ticket' : serialize_ticket.data}})         

# this functions is used for retrive all master of ticket module in database with necessary validations with and without login
class getMasterData(APIView):

    serializer_urgency_class = UrgencySerializer
    serializer_status_class = StatusSerializer
    serializer_type_class = TypeSerializer
   

    def get(self, request, **kwargs):
      
        try:           
            UrgencyData = Urgency.objects.filter(active=True)
            serialize_urgency = self.serializer_urgency_class(UrgencyData, many=True)           
            TypeData = Type.objects.filter(active=True)
            serialize_type = self.serializer_status_class(TypeData, many=True)
            StatusData = Status.objects.filter(active=True)
            serialize_status = self.serializer_type_class(StatusData, many=True)




        except Exception as e:          
            return Response({'status': False,'Message':"Error in retriving master data"})

        return Response({'status': True,'Message':"Here is master data",'data': {'urgency' : serialize_urgency.data,'status' : serialize_status.data,'type' : serialize_type.data}})         

# this functions is used for retrive specific detail of ticket  in database with necessary validations with and without login
# used another techinic for getting request data
class GetTicket(CheckPermission,APIView):
    serializer_ticket_class = TicketSerializer
    lookup_field = 'id'
    def get(self, request, **kwargs):
        try:       

            TicketData = Ticket.objects.filter(id=self.kwargs['id'],active=True)
            serialize_ticket = self.serializer_ticket_class(TicketData, many=True)

        except Exception as e:          
            return Response({'status': False,'Message':"Error in retriving Ticket data"})

        return Response({'status': True,'Message':"Here is Ticket data",'data': serialize_ticket.data })         


         