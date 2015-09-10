from django.shortcuts import render

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
