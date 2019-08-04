from django.conf.urls import url, include

from school_data import views

from django.urls import path

urlpatterns = [
    path('department/', views.departmentAPI, name="department"),

    #path('department/', views.DepartmentAPI.as_view()),


]