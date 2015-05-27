from django.db import models

def img_upload_dir_path(instance, filename):
    """files to be saved to MEDIA_ROOT/uploads/%Y_%m_%d_filename"""
    return 'uploads/%Y_%m_%d_{0}'.format(filename)


# Create your models here.
class FIFATeam(models.Model):
    team_name = models.CharField(max_length=100, help_text="FIFA Team Name", unique=True)
    team_avatar = models.ImageField(upload_to=img_upload_dir_path, )

class Match(models.Model):
    match_date = models.DateTimeField('when match played', null=True, blank=True, default='')
    contestant_one_score = models.IntegerField(null=True, blank=True, default=0,)
    contestant_two_score = models.IntegerField(null=True, blank=True, default=0,)

