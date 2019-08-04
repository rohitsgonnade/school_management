

from django.urls import path, include
#from .views import UserAPI # LoginAPI,

from users.views import current_user_API

from django.contrib.auth import views

from .views import after_loginAPI,  get_parents, get_children, get_upcoming_exams, create_exam_API, student_attendance_view, create_attendance_API, student_exam_view
urlpatterns = [
   # path('api/auth/', include('knox.urls')),
    #path("auth/login/", LoginAPI.as_view()),

    #path('auth/user', UserAPI.as_view()),

    path('current_user/',  current_user_API),

    #create login page in templates\registration
    path('', views.LoginView.as_view(), name="login"),
    path('logout/', views.LogoutView.as_view(), name='logout'),
    
    path('home/', after_loginAPI, name="home"),

    path('get_parents/',get_parents),

    path('get_children/',get_children),


    path("upcoming_exams/<int:pk>/", get_upcoming_exams),

    path("create_exam/<int:pk>", create_exam_API),

    path("save_attendance/<str:pk>", student_attendance_view, name = "save_attendance"),

    path("create_attendance/", create_attendance_API),

    path("save_marks/<str:pk>", student_exam_view),

    #path('auth/parent', ParentAPI.as_view()),
]