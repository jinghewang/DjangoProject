from django.db import models

# Create your models here.


class Student(models.Model):
    id = models.BigIntegerField
    name = models.CharField(max_length=20, default='a')
    age = models.IntegerField(default=0)


class Book(models.Model):
    name = models.CharField(max_length=50)
    pub_date = models.DateField()


class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')


class Choice(models.Model):
    question = models.ForeignKey(Question)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)


