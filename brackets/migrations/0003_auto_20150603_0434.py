# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('brackets', '0002_auto_20150603_0410'),
    ]

    operations = [
        migrations.CreateModel(
            name='Contestant',
            fields=[
                ('id', models.AutoField(auto_created=True, verbose_name='ID', primary_key=True, serialize=False)),
                ('fifa_team', models.ForeignKey(to='brackets.FIFATeam')),
                ('player_1', models.ForeignKey(to=settings.AUTH_USER_MODEL, help_text='Player 1', related_name='player_1')),
                ('player_2', models.ForeignKey(null=True, blank=True, help_text='Player 2', to=settings.AUTH_USER_MODEL, related_name='player_2')),
                ('player_3', models.ForeignKey(null=True, blank=True, help_text='Player 3', to=settings.AUTH_USER_MODEL, related_name='player_3')),
                ('player_4', models.ForeignKey(null=True, blank=True, help_text='Player 4', to=settings.AUTH_USER_MODEL, related_name='player_4')),
            ],
        ),
        migrations.CreateModel(
            name='Fixture',
            fields=[
                ('id', models.AutoField(auto_created=True, verbose_name='ID', primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=180, help_text='Fixture Name', unique=True)),
                ('description', models.CharField(max_length=180, help_text='Description', null=True, blank=True)),
                ('date_created', models.DateTimeField(auto_now_add=True)),
                ('date_updated', models.DateTimeField(auto_now=True)),
                ('fixture_type', models.ForeignKey(to='brackets.FixtureType')),
            ],
        ),
        migrations.RemoveField(
            model_name='contestants',
            name='fifa_team',
        ),
        migrations.RemoveField(
            model_name='contestants',
            name='player_1',
        ),
        migrations.RemoveField(
            model_name='contestants',
            name='player_2',
        ),
        migrations.RemoveField(
            model_name='contestants',
            name='player_3',
        ),
        migrations.RemoveField(
            model_name='contestants',
            name='player_4',
        ),
        migrations.RemoveField(
            model_name='fixtures',
            name='fixture_type',
        ),
        migrations.AlterField(
            model_name='match',
            name='contestant_1',
            field=models.ForeignKey(null=True, to='brackets.Contestant', help_text='Contestant 1', related_name='contestant_1'),
        ),
        migrations.AlterField(
            model_name='match',
            name='contestant_2',
            field=models.ForeignKey(null=True, to='brackets.Contestant', help_text='Contestant 2', related_name='contestant_2'),
        ),
        migrations.DeleteModel(
            name='Contestants',
        ),
        migrations.DeleteModel(
            name='Fixtures',
        ),
        migrations.AddField(
            model_name='match',
            name='fixture',
            field=models.ForeignKey(to='brackets.Fixture', help_text='Part of Fixure', default=1),
            preserve_default=False,
        ),
    ]
