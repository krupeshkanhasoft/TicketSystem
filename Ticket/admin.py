# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

from Ticket.models import Urgency,Type,Status,Ticket,Comment

# with admin panel we can use CRUD fucntionlity of app
# Register your models here.
admin.site.register(Urgency)
admin.site.register(Type)
admin.site.register(Status)
admin.site.register(Ticket)
admin.site.register(Comment)

# Register your models here.
