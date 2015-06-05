# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('brackets', '0004_auto_20150603_0446'),
    ]

    operations = [
        migrations.RenameField(
            model_name='match',
            old_name='Match Complete',
            new_name='match_complete',
        ),
        migrations.RenameField(
            model_name='match',
            old_name='Match Date',
            new_name='match_date',
        ),
        migrations.RenameField(
            model_name='match',
            old_name='Team 1 Score',
            new_name='team_1_score',
        ),
        migrations.RenameField(
            model_name='match',
            old_name='Team 2 Score',
            new_name='team_2_score',
        ),
    ]
