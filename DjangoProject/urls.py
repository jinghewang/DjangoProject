"""DjangoProject URL Configuration

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
from django.conf.urls import include, url
from django.contrib import admin

# self
from student.views import *

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^student/', sayhello),
    url(r'^hello/', hello),
    url(r'^showStudents/$', showStudents),
    url(r'^showRealStudents/$', showRealStudents),
    url(r'^$', showIndex),
    # polls
    url(r'^polls/$', index, name='detail'),
    url(r'^polls/(?P<question_id>[0-9]+)/$', detail, name='detail'),
    url(r'^polls/(?P<question_id>[0-9]+)/vote/$', vote, name='vote'),
    url(r'^polls/(?P<question_id>[0-9]+)/results/$', results, name='results'),
    # session
    url(r'^session/$', session, name='session'),
    url(r'^session2/$', session2, name='session2'),
]
