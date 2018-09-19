import json
import datetime
from django.http import HttpResponse
from uhr import settings
from users.models import BlockIp


class BlockIP(object):

    def process_request(self, request):

        ip_address = request.META.get('REMOTE_ADDR')  # Get client IP


        if "reset_ip_address" not in request.path:
                blockip_obj = BlockIp.objects.filter(ip_address=ip_address)
                if blockip_obj.exists():
                    blockip_obj = blockip_obj[0]

                    # print datetime.datetime.utcnow()
                    # print blockip_obj.last_failed_time

                    delay = datetime.datetime.utcnow() - blockip_obj.last_failed_time
                    # print float(delay.seconds)/3600

                    if blockip_obj.failure_attempt >= settings.FAIL_ATTEMPT_LIMIT and float(delay.seconds)/3600 < settings.COOLOFF_TIME:
                        return HttpResponse(json.dumps({'Failure': {'Warnings': {}, 'Code': '544', 'ShortText': 'Your IP Address is blocked for %s hour' % settings.COOLOFF_TIME}}), content_type='application/json')

                return
        else:
            return