
from django.http import HttpResponse
import json
from users.models import token
from django.utils import timezone
import datetime
import uuid
from sentact import settings
from django.core.validators import validate_email
from django.core.exceptions import ValidationError


# Create class for checking authentication of logged user ,if user is authenticated then and then he can access other functions
# token is expried or not
# token is valid or not
class CheckPermission(object):


    def dispatch(self, request,*args, **kwargs):

        # print "calling dispatchingg.................", request.META.get('HTTP_AUTHORIZATION')
        self.permission_error = False
        self.expire = False
        self.missing_token = False
        self.token_not_exist = False

        if not 'HTTP_AUTHORIZATION'in request.META:
            return HttpResponse(json.dumps({'status': False,'Message':"Token is required,Please Login again"}), content_type="application/json")
        if not len((request.META.get('HTTP_AUTHORIZATION')).split(' ')) == 2:
            return HttpResponse(json.dumps({'error': {'code':"1",'message':"Invalid Token"}}), content_type="application/json")
        tokens = (request.META.get('HTTP_AUTHORIZATION')).split(' ')[1]

        client_data = token.objects.filter(token=tokens,user__is_active=True)
        if client_data.exists():
            # check token expiration
            data = client_data[0]
            # Actually timedelta 3 minutes is not necessary for server, but for local to solve many time login page redirect error,
            # i have added 3 minutes +, to make sure that time difference must be positive.
            delay = (timezone.now()) - data.created
            # print float(delay.seconds)/3600
            if float(delay.seconds)/3600 > settings.EXPIRE_TIME:  # match hour
                client_data.delete()
                return HttpResponse(json.dumps({'status': False,'Message':"Token is required,Please Login again"}), content_type="application/json")

            # print "::::::::::::", timezone.now()
            client_obj = client_data[0]
            client_obj.created = timezone.now()
            client_obj.save()

            self.user_id = data.user_id


        else:
            return HttpResponse(json.dumps({'status': False,'Message':"Token doesn't exist,Please Login again"}), content_type="application/json")
        return super(CheckPermission, self).dispatch(request, *args, **kwargs)



def validateEmail(email):
    try:
        validate_email(email)
        return True
    except ValidationError:
        return False