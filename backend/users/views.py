from django.contrib.auth.decorators import login_required
from rest_framework.decorators import api_view, permission_classes
from django.shortcuts import render, redirect, reverse

from .forms import Exam_Form, Create_Attendance_Form, student_attendance_form, save_marks_form

# Create your views here.

from rest_framework import viewsets, permissions, generics

from school_data.serializer import SubjectSerializer, Subject

from .serializers import LoginUserSerializer, UserSerializer, ParentProfileSerializer, StudentProfileSerializer, TeacherProfileSerializer, ExamSerializer

from django.http import JsonResponse

from .models import StudentProfile, TeacherProfile, ParentProfile, User, Exam, Attendance, Student_Attendance, Exam_Marks

import datetime




# login purpose
# class LoginAPI(generics.GenericAPIView):
# serializer_class =  LoginUserSerializer

# def post(self, request, *args, **kwargs):
#   serializer = self.get_serializer(data = request.data)
#  serializer.is_valid(raise_exception = True)
# user = serializer.validated_data

# return Response({
#   "user": UserSerializer(user, context=self.get_serializer_context()).data,
#  "token": AuthToken.objects.create(user)[1]
# })


# API to return user data of the logged in user
# use this API to determine if the user is logged in and retrieve their token 
# for performing user specific api calls.
class UserAPI(generics.RetrieveAPIView):
    permission_classes = [permissions.IsAuthenticated, ]
    serializer_class = UserSerializer

    def get_object(self):
        return self.request.user


# this is actually used , not UserAPI, UserAPI don't work while getting user data from rest using React
@login_required(login_url='/')
@api_view(['GET'])
def current_user_API(request):
    serializer = UserSerializer(request.user)

    return Response(serializer.data)


# only after login
#homepages as per different users
@api_view(['GET'])
@login_required(login_url='/')
def after_loginAPI(request):
    name = request.user.first_name + request.user.last_name
    role = request.user.role  # get role of the user

    context = {
        'name': name,
    }

    if role == 'p':  # if user is parent
        return render(request, "parent_home.html")
    elif role == 's':  # if student
        return render(request, "student_home.html")
    elif role == 't':
        return render(request, "teacher_home.html")
    elif request.user.is_superuser:
        # I want to redirect to admin page but not getting redirected
        return render(request, "admin/")

    return render(request, "home.html", context)



#get all parents
#not used in the project
@login_required(login_url='/')
@api_view(['GET'])
def get_parents(request):
    if request.method == 'GET':
        parents = ParentProfile.objects.all()
        serializer = ParentProfileSerializer(parents, many=True)
        return JsonResponse(serializer.data, safe=False)


#to get list of children in parent home page
#using ajax call, list is retrieved and displayed
@login_required(login_url='/')
@api_view(['GET'])
def get_children(request):
    if request.method == "GET":
        if request.user.role == 'p':  # if parent
            parent = ParentProfile.objects.get(
                user=User.objects.get(username=request.user.username))

            serializer = ParentProfileSerializer(parent, many=False)
            get_parent_id = serializer.data['user']

            childs = StudentProfile.objects.filter(parent=get_parent_id)

            serializer = StudentProfileSerializer(childs, many=True)

            return JsonResponse(serializer.data, safe=False)
        else:
            return render(request, "no_access.html")


#to get list of subjetxs
#at this point this is used only for teacher but can be readily used for students
@api_view(['GET'])
@login_required(login_url='/')
def get_subjects(request, pk):

    if request.method == 'GET':

        role = request.user.role

        # parent will send user id of student as pk,
        # student will send its own id as pk

        # teacher will send its own id as pk

        if role == 'p' or role == 's':  # if parent or student
            # pk is user id of student

            student = StudentProfile.objects.get(user=User.objects.get(pk=pk))

            serializer = StudentProfileSerializer(student, many=False)

        else:  # teacher can see exams of the subjects he/she teach
            teacher = TeacherProfile.objects.get(user=User.objects.get(pk=pk))

            serializer = TeacherProfileSerializer(teacher, many=False)

        #get all subjects
        subject = serializer.data['subject_id']

        subjects = Subject.objects.filter(subject_id__in = subject)
        
        serializer = SubjectSerializer(subjects, many = True)

        data_context = serializer.data

        return render(request, "subjects.html", { "subjects" :data_context })

        # directly go to the link and see the response
        #return JsonResponse(serializer.data, safe=False)


#used for creating exam
@login_required(login_url='/')
@api_view(['GET','POST'])
def create_exam_API(request, pk):

    form = Exam_Form(request.user)

   # if request.method == 'POST':
    #  form = Exam_form(request.user, request.POST)
    # if form.is_valid():
    #  exam = form.save(commit=False)
    # exam.created_by = TeacherProfile.objects.get(user = User.objects.get(pk = pk))
    # exam.save()

    if request.user.role == 't':
        if request.method == "POST"  :
            form = Exam_Form(request.user, request.POST)

            if form.is_valid():

                exam = Exam(
                    name=form.cleaned_data["name"],
                    exam_date=form.cleaned_data["exam_date"],
                    subject_id=form.cleaned_data["subject"],
                    exam_time=form.cleaned_data["exam_time"],
                    max_marks=form.cleaned_data["max_marks"],
                    created_by=TeacherProfile.objects.get(
                        user=User.objects.get(username=request.user.username)),
                )

                exam.save()

                return redirect('home')
    else:
        return render(request, "no_access.html")

    context = {"form": form, }

    return render(request, "create_exam.html", context)


#fetch exams on and later todays date
@api_view(['GET'])
@login_required(login_url='/')
def get_upcoming_exams(request, pk):

    if request.method == 'GET':

        role = request.user.role

        # parent will send user id of student as pk,
        # student will send its own id as pk

        # teacher will send its own id as pk

        if role == 'p' or role == 's':  # if parent or student
            # pk is user id of student

            student = StudentProfile.objects.get(user=User.objects.get(pk=pk))

            serializer = StudentProfileSerializer(student, many=False)

        else:  # teacher can see exams of the subjects he/she teach
            teacher = TeacherProfile.objects.get(user=User.objects.get(pk=pk))

            serializer = TeacherProfileSerializer(teacher, many=False)

        subject = serializer.data['subject_id']

        today = datetime.date.today()

        # from exam table fetch exams of related subject
        # want to show only exams which are today or later
        exams = Exam.objects.filter(
            subject_id__in=subject, exam_date__gte=today)

        serializer = ExamSerializer(exams, many=True)

        data_context = serializer.data

        # direct rendering html page with page with data
        return render(request, "view_exams.html", {"exams": data_context})

        # directly go to the link and see the response
        # return JsonResponse(serializer.data, safe=False)



#create attendace and redirect to save_attendance 
@login_required(login_url="/")
@api_view(["GET","POST"])
def create_attendance_API(request):
    form = Create_Attendance_Form(request.user)

    if request.user.role == 't' :
        if request.method == "POST":
            form = Create_Attendance_Form(request.user, request.POST)

            if form.is_valid():
                subject = form.cleaned_data["subject"]
                attendance = Attendance(
                    subject_id=form.cleaned_data["subject"],
                    date_of_lecture=form.cleaned_data["lecture_date"],
                    teacher_id=TeacherProfile.objects.get(
                        user=User.objects.get(username=request.user.username)),

                )

                attendance.save()
                #redirect to save attendance page with subject id
                return redirect('save_attendance', str(subject))
    else:
        return render(request, "no_access.html")

    context = {
        'form': form,
    }
    return render(request, "create_attendance.html", context)

#save attendance 
@login_required(login_url="/")
@api_view(["GET","POST"])
def student_attendance_view(request, pk):
    form = student_attendance_form(request.user, subject_id=pk)

    if request.user.role == 't':
        if request.method == "POST":

            form = student_attendance_form(
                request.user, request.POST, subject_id=pk)

            # save attendance of only checked students
            # if want to get % of attendance divide total num of occurances from student_attendance by total number of lectures in Attendance table
            if form.is_valid():
                # only checked student values
                # foreach value in selected checbox
                for st in form.cleaned_data["students"]:
                    #create student_attendance object and save
                    attendance = Student_Attendance(
                        student_id=st,
                        present=True,
                        attendance_id=form.cleaned_data["attendance_id"],

                    )

                    attendance.save()

                # return JsonResponse(request.POST)

                return redirect('home')
    else:
        return render(request, "no_access.html")

    context = {"form": form, }

    return render(request, "student_attendance.html", context)

#save marks for exam
@login_required(login_url="/")
@api_view(["GET","POST"])
def save_marks_view(request,pk):
    form = save_marks_form(request.user , subject_id= pk)

    if request.user.role == 't':
        if request.method == "POST":

            form = save_marks_form(
                request.user, request.POST , subject_id= pk)

            if form.is_valid():
                
                for field in list(form.fields)[1:]:
                    marks = Exam_Marks(
                        exam_id = form.cleaned_data["exam_id"],
                        student_id = StudentProfile.objects.get(user = field[0]),
                        marks_obtained = form.cleaned_data[field]
                    )

                    marks.save()

                return redirect('home')
    else:
        return render(request, "no_access.html")

    context = {"form": form, }

    return render(request, "save_exam_marks.html", context)