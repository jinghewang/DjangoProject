from django.db import models

# Create your models here.


class Student(models.Model):
    id = models.BigIntegerField
    name = models.CharField(max_length=20, default='a')
    age = models.IntegerField(default=0)


class Book(models.Model):
    name = models.CharField(max_length=50)
    pub_date = models.DateField()



