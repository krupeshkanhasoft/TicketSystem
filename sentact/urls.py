from django.conf.urls import url,include
from django.contrib import admin

# URLS of applications
urlpatterns = [
    # Examples:
    # url(r'^$', 'sentact.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),

    url(r'^v1/users/', include('users.urls', namespace='v1')),

   

     url(r'^v1/Tickets/', include('Ticket.urls', namespace='v1')),
]
