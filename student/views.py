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


from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.views import generic


class IndexView(generic.ListView):
    template_name = 'polls/index.html'
    context_object_name = 'latest_question_list'

    def get_queryset(self):
        """Return the last five published questions."""
        return Question.objects.order_by('-pub_date')[:5]


class DetailView(generic.DetailView):
    model = Question
    template_name = 'polls/detail.html'


class ResultsView(generic.DetailView):
    model = Question
    template_name = 'polls/results.html'


def vote(request, question_id):
    p = get_object_or_404(Question, pk=question_id)
    try:
        selected_choice = p.choice_set.get(pk=request.POST['choice'])
    except (KeyError, Choice.DoesNotExist):
        # Redisplay the question voting form.
        return render(request, 'polls/detail.html', {
            'question': p,
            'error_message': "You didn't select a choice.",
        })
    else:
        selected_choice.votes += 1
        selected_choice.save()
        # Always return an HttpResponseRedirect after successfully dealing
        # with POST data. This prevents data from being posted twice if a
        # user hits the Back button.
        return HttpResponseRedirect(reverse('results', args=(p.id,)))