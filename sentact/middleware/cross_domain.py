import re

from django.utils.text import compress_string
from django.utils.cache import patch_vary_headers

from django import http

# try:
#     import settings
#     XS_SHARING_ALLOWED_ORIGINS = settings.XS_SHARING_ALLOWED_ORIGINS
#     XS_SHARING_ALLOWED_METHODS = settings.XS_SHARING_ALLOWED_METHODS
# except:
XS_SHARING_ALLOWED_ORIGINS = '*'
XS_SHARING_ALLOWED_METHODS = ['POST','GET', 'DELETE', 'PUT']


class XsSharing(object):
    """
        This middleware allows cross-domain XHR using the html5 postMessage API.

        Access-Control-Allow-Origin: http://foo.example
        Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE
    """
    def process_request(self, request):
        if 'HTTP_ACCESS_CONTROL_REQUEST_METHOD' in request.META:
            response = http.HttpResponse()
            response['Access-Control-Allow-Origin']  = XS_SHARING_ALLOWED_ORIGINS
            response['Access-Control-Allow-Methods'] = ",".join( XS_SHARING_ALLOWED_METHODS )
            # response['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8'
            response['Access-Control-Allow-Headers'] = "Content-Type, client-type, Access-Control-Allow-Headers, Authorization, X-Requested-With"
            # response['Access-Control-Allow-Headers'] = "Authorization, content-type"
            response['Access-Control-Max-Age'] = 86400
            
            return response

        return None

    def process_response(self, request, response):
        # Avoid unnecessary work
        if response.has_header('Access-Control-Allow-Origin'):
            return response

        response['Access-Control-Allow-Origin']  = XS_SHARING_ALLOWED_ORIGINS
        response['Access-Control-Allow-Methods'] = ",".join( XS_SHARING_ALLOWED_METHODS )
        # response['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8'
        response['Access-Control-Allow-Headers'] = "Content-Type, client-type,Access-Control-Allow-Headers, Authorization, X-Requested-With"
        # response['Access-Control-Allow-Headers'] = "Authorization, content-type"
        return response