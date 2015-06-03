# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('brackets', '0003_auto_20150603_0434'),
    ]

    operations = [
        migrations.AddField(
            model_name='contestant',
            name='description',
            field=models.CharField(default='matt vs. the world', help_text='Descrption', max_length=120),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='match',
            name='contestant_2_at',
            field=models.CharField(default='A', choices=[('H', 'Home'), ('A', 'Away')], max_length=1),
        ),
    ]
