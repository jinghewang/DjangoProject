from django.shortcuts import render, render_to_response

# Create your views here.

import datetime
from django.http import HttpResponse
from student.models import *


def sayhello(request):
    s = 'Hello World!'
    current_time = datetime.datetime.now()
    html = '<html><head><title>student</title></head><body><h1> %s </h1><p> %s </p></body></html>' % (s, current_time)
    return HttpResponse(html)


def hello(request):
    return HttpResponse("Hello World")


def showStudents(request):
    list = [{'id': 1, 'name': 'Jack-2', 'age': 28}, {'id': 2, 'name': 'Rose', 'age': 32}]
    return render_to_response('student.html', {'students': list})


def showRealStudents(request):
    list = Student.objects.all()
    return render_to_response('student.html', {'students': list})


def showIndex(request):
    import django.contrib.auth
    user = django.contrib.auth.get_user(request)
    if isinstance(user,django.contrib.auth.models.AnonymousUser):
        print 'logoff'
    else:
        print 'login'+ user.username
    return render_to_response('index.html', {'title': 'wjh'})
