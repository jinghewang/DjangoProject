from django.db import models

# Create your models here.


class Student(models.Model):
    id = models.BigIntegerField
    name = models.CharField(max_length=20, default='a')
    age = models.IntegerField(default=0)


class Book(models.Model):
    name = models.CharField(max_length=50)
    pub_date = models.DateField()

# from django.utils.timezone import *
# from datetime import datetime


class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')

    def was_published_recently(self):
        return True;# self.pub_date >= timezone.now() - datetime.timedelta(days=1)
    was_published_recently.admin_order_field = 'pub_date'
    was_published_recently.boolean = True
    was_published_recently.short_description = 'Published recently?'


class Choice(models.Model):
    question = models.ForeignKey(Question)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)


