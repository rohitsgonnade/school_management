from django.contrib import admin

# Register your models here.

from .models import Department, Subject, Courses

admin.site.register(Department)
admin.site.register(Courses)
admin.site.register(Subject)
