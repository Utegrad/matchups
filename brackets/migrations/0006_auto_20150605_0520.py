# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('brackets', '0005_auto_20150605_0451'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='match',
            name='match_date',
        ),
        migrations.AddField(
            model_name='match',
            name='match_scheduled',
            field=models.DateField(blank=True, null=True, help_text='Date Scheduled'),
        ),
        migrations.AddField(
            model_name='match',
            name='match_updated',
            field=models.DateTimeField(auto_now=True, default=datetime.datetime(2015, 6, 5, 5, 20, 39, 669938, tzinfo=utc)),
            preserve_default=False,
        ),
    ]
