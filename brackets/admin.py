from django.contrib import admin
from .models import Match, FIFATeam

# Register your models here.
admin.site.register([Match, FIFATeam])
