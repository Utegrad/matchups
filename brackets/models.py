from django.db import models
from datetime import datetime
from django.contrib.auth.models import User

def img_upload_dir_path(instance, filename):
    """files to be saved to MEDIA_ROOT/uploads/TIMESTAMP_filename"""
    date = datetime.strftime(datetime.now(),"%Y-%m-%d_%H%M%S")
    return 'uploads/{0}_{1}'.format(date, filename)


# Create your models here.
class FIFATeam(models.Model):
    team_name = models.CharField(max_length=100, help_text="FIFA Team Name", unique=True)
    team_avatar = models.ImageField(upload_to=img_upload_dir_path, )

    def __str__(self):
        return self.team_name


class FixtureType(models.Model):
    name = models.CharField(max_length=100, help_text="Fixture Type Name", unique=True,
                            null=False, blank=False)

    def __str__(self):
        return self.name

class Fixture(models.Model):
    fixture_type = models.ForeignKey('FixtureType')
    name = models.CharField(max_length=180, help_text="Fixture Name", unique=True,
                            null=False, blank=False, )
    description = models.CharField(max_length=180, help_text="Description", unique=False,
                                   null=True, blank=True, )
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

class Contestant(models.Model):
    player_1 = models.ForeignKey(User, help_text="Player 1", null=False, blank=False,
                                 unique=False, related_name="player_1")
    player_2 = models.ForeignKey(User, help_text="Player 2", null=True, blank=True,
                                 unique=False, related_name="player_2")
    player_3 = models.ForeignKey(User, help_text="Player 3", null=True, blank=True,
                                 unique=False, related_name="player_3")
    player_4 = models.ForeignKey(User, help_text="Player 4", null=True, blank=True,
                                 unique=False, related_name="player_4")
    fifa_team = models.ForeignKey('FIFATeam')
    description = models.CharField(max_length=120, help_text="Descrption", null=False, blank=False)

    def __str__(self):
        return self.description


class Match(models.Model):
    HOME = 'H'
    AWAY = 'A'
    LOCATION = ( (HOME, 'Home'), (AWAY, 'Away'), )
    match_date = models.DateField(name="Match Date", null=True, blank=True,
                                      unique=False, help_text="Date Scheduled or Taken Place")
    team_1_score = models.IntegerField(name="Team 1 Score", null=True, default=0, blank=True,
                                       unique=False, help_text="Team 1 Score")
    team_2_score = models.IntegerField(name="Team 2 Score", null=True, default=0, blank=True,
                                       unique=False, help_text="Team 2 Score")
    match_complete = models.BooleanField(name="Match Complete", null=False, default=False,
                                         blank=True, help_text="Match complete, yes or no")
    contestant_1 = models.ForeignKey('Contestant', null=True, unique=False,
                                     help_text="Contestant 1", related_name="contestant_1")
    contestant_2 = models.ForeignKey('Contestant', null=True, unique=False,
                                     help_text="Contestant 2", related_name="contestant_2")
    contestant_1_at = models.CharField(max_length=1, choices=LOCATION, default=HOME)
    contestant_2_at = models.CharField(max_length=1, choices=LOCATION, default=AWAY)
    fixture = models.ForeignKey('Fixture', help_text="Part of Fixure", null=False, blank=False)

    # TODO __str__ function to return something meaningful for class like contestant 1 __str__ vs contestant 2 __str__
    # TODO figure out related object references


