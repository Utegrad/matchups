# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('brackets', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Contestants',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, verbose_name='ID', auto_created=True)),
                ('fifa_team', models.ForeignKey(to='brackets.FIFATeam')),
                ('player_1', models.ForeignKey(help_text='Player 1', related_name='player_1', to=settings.AUTH_USER_MODEL)),
                ('player_2', models.ForeignKey(null=True, help_text='Player 2', related_name='player_2', blank=True, to=settings.AUTH_USER_MODEL)),
                ('player_3', models.ForeignKey(null=True, help_text='Player 3', related_name='player_3', blank=True, to=settings.AUTH_USER_MODEL)),
                ('player_4', models.ForeignKey(null=True, help_text='Player 4', related_name='player_4', blank=True, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Fixtures',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, verbose_name='ID', auto_created=True)),
                ('name', models.CharField(unique=True, max_length=180, help_text='Fixture Name')),
                ('description', models.CharField(null=True, blank=True, max_length=180, help_text='Description')),
                ('date_created', models.DateTimeField(auto_now_add=True)),
                ('date_updated', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='FixtureType',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, verbose_name='ID', auto_created=True)),
                ('name', models.CharField(unique=True, max_length=100, help_text='Fixture Type Name')),
            ],
        ),
        migrations.RemoveField(
            model_name='match',
            name='contestant_one_score',
        ),
        migrations.RemoveField(
            model_name='match',
            name='contestant_two_score',
        ),
        migrations.RemoveField(
            model_name='match',
            name='match_date',
        ),
        migrations.AddField(
            model_name='match',
            name='Match Complete',
            field=models.BooleanField(default=False, help_text='Match complete, yes or no'),
        ),
        migrations.AddField(
            model_name='match',
            name='Match Date',
            field=models.DateField(null=True, blank=True, help_text='Date Scheduled or Taken Place'),
        ),
        migrations.AddField(
            model_name='match',
            name='Team 1 Score',
            field=models.IntegerField(null=True, default=0, blank=True, help_text='Team 1 Score'),
        ),
        migrations.AddField(
            model_name='match',
            name='Team 2 Score',
            field=models.IntegerField(null=True, default=0, blank=True, help_text='Team 2 Score'),
        ),
        migrations.AddField(
            model_name='match',
            name='contestant_1_at',
            field=models.CharField(default='H', choices=[('H', 'Home'), ('A', 'Away')], max_length=1),
        ),
        migrations.AddField(
            model_name='fixtures',
            name='fixture_type',
            field=models.ForeignKey(to='brackets.FixtureType'),
        ),
        migrations.AddField(
            model_name='match',
            name='contestant_1',
            field=models.ForeignKey(null=True, help_text='Contestant 1', related_name='contestant_1', to='brackets.Contestants'),
        ),
        migrations.AddField(
            model_name='match',
            name='contestant_2',
            field=models.ForeignKey(null=True, help_text='Contestant 2', related_name='contestant_2', to='brackets.Contestants'),
        ),
    ]
