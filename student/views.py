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


def index(request):
    question = Question.objects.all()
    return render_to_response('polls/index.html', {'latest_question_list': question})



def detail(request, question_id):
    question = Question.objects.get(pk=question_id)
    return render_to_response('polls/detail.html', {'question': question})


def results(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    return render(request, 'polls/results.html', {'question': question})

from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse


from django.template import RequestContext
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def vote(request, question_id):
    p = get_object_or_404(Question, pk=question_id)
    try:
        selected_choice = p.choice_set.get(pk=request.POST['choice'])
    except (KeyError, Choice.DoesNotExist):
        # Redisplay the question voting form.
        return render(request, 'polls/detail.html', {
            'question': p,
            'error_message': "You didn't select a choice.",
            'context_instance':RequestContext(request),
        })
    else:
        selected_choice.votes += 1
        selected_choice.save()
        # Always return an HttpResponseRedirect after successfully dealing
        # with POST data. This prevents data from being posted twice if a
        # user hits the Back button.
        return HttpResponseRedirect(reverse('results', args=(p.id,)))


def session(request):
    request.session['name'] = 'wjh'
    return HttpResponse('set session:'+request.session.get('name'))


def session2(request):
    print request.session.get('name')
    return HttpResponse('name:'+request.session.get('name'))
