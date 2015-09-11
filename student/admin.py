from django.contrib import admin

# Register your models here.
from models import *
admin.site.register({Book})


# choice
class ChoiceAdmin(admin.ModelAdmin):
    list_display = ('choice_text', 'votes')


admin.site.register(Choice,ChoiceAdmin)


# question
class ChoiceInline(admin.StackedInline):
    model = Choice
    extra = 3


class ChoiceInline2(admin.TabularInline):
    model = Choice
    extra = 3


class QuestionAdmin(admin.ModelAdmin):
    # fields = ['pub_date','question_text']
    list_display = ('question_text', 'pub_date')
    fieldsets = [
        (None, {'fields': ['question_text']}),
        ('Date information', {'fields': ['pub_date'],'classes': ['collapse']}),
    ]
    inlines = [ChoiceInline2]

admin.site.register(Question,QuestionAdmin)