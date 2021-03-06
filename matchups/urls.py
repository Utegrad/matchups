"""matchups URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import include, url, patterns
from django.contrib import admin
from django.contrib.staticfiles.storage import staticfiles_storage
from django.views.generic.base import RedirectView
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^brackets$', include('brackets.urls', namespace="brackets")),
    url(
        r'^favicon.ico$',
        RedirectView.as_view(
            url=staticfiles_storage.url('img/favicon.ico'),
            permanent=False),
        name="favicon"
    ),
]

urlpatterns += patterns(
    'django.contrib.auth.views',
    url(r'^login/$', 'login',
        {'template_name': 'login.html'},
        name='matchups_login'),
    url(r'^logout/$', 'logout',
        {'next_page': 'brackets:brackets_home'},
        name='matchups_logout'),
)