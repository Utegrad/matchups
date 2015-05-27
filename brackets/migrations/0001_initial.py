# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import brackets.models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='FIFATeam',
            fields=[
                ('id', models.AutoField(primary_key=True, verbose_name='ID', serialize=False, auto_created=True)),
                ('team_name', models.CharField(unique=True, max_length=100, help_text='FIFA Team Name')),
                ('team_avatar', models.ImageField(upload_to=brackets.models.img_upload_dir_path)),
            ],
        ),
        migrations.CreateModel(
            name='Match',
            fields=[
                ('id', models.AutoField(primary_key=True, verbose_name='ID', serialize=False, auto_created=True)),
                ('match_date', models.DateTimeField(null=True, verbose_name='when match played', blank=True, default='')),
                ('contestant_one_score', models.IntegerField(null=True, blank=True, default=0)),
                ('contestant_two_score', models.IntegerField(null=True, blank=True, default=0)),
            ],
        ),
    ]
