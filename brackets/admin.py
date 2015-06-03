from django.contrib import admin
from .models import Match, FIFATeam, Fixture, FixtureType, Contestant

# Register your models here.
admin.site.register([Match, FIFATeam, FixtureType,Contestant, Fixture ])
