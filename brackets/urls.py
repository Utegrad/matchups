from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', 'brackets.views.brackets',
        name='brackets_home'),

]
