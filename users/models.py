from django.db import models
from django.contrib.auth.models import User


# Model for User's app

class token(models.Model):
    user = models.ForeignKey(User)
    token = models.CharField(max_length=100, blank=True)
    created = models.DateTimeField()


