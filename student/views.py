from django.shortcuts import render, render_to_response

# Create your views here.

import datetime
from django.http import HttpResponse


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
