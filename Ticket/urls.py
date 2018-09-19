
from django.conf.urls import  include, url
from api import getMasterData,CreateTicket,GetAllTicketAdmin, \
		CreateTicketAdmin,UpdateTicketStatusAdmin,UpdateTicketAdmin,CreateTicketCommentAdmin, \
		UpdateTicketCommentAdmin,DeleteTicketCommentAdmin,DeleteTicketAdmin,GetTicket


# URLS for Ticket App
urlpatterns = [
  
    url(r'^getMasterData/$', getMasterData.as_view(), name='home2'),
  
    url(r'^CreateTicket/$', CreateTicket.as_view(), name='home2'),
    url(r'^CreateTicketAdmin/$', CreateTicketAdmin.as_view(), name='home2'),
    url(r'^UpdateTicketAdmin/$', UpdateTicketAdmin.as_view(), name='home2'),
    url(r'^DeleteTicketAdmin/$', DeleteTicketAdmin.as_view(), name='home2'),
    url(r'^UpdateTicketStatusAdmin/$', UpdateTicketStatusAdmin.as_view(), name='home2'),
    url(r'^CreateTicketCommentAdmin/$', CreateTicketCommentAdmin.as_view(), name='home2'),
    url(r'^UpdateTicketCommentAdmin/$', UpdateTicketCommentAdmin.as_view(), name='home2'),
    url(r'^DeleteTicketCommentAdmin/$', DeleteTicketCommentAdmin.as_view(), name='home2'),
    url(r'^GetAllTicketAdmin/$', GetAllTicketAdmin.as_view(), name='home2'),
    url(r'^GetTicket/(?P<id>[\w.+_-]+)/$', GetTicket.as_view(), name='Single-Ticket'),
    ]


