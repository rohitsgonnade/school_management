from django import forms
from .models import Subject, Exam, TeacherProfile, User, Teacher_Subject, StudentProfile, Student_Subject, Attendance, Exam
from .serializers import TeacherProfileSerializer


class Exam_ModelForm(forms.ModelForm):

    choice = []

    subject = forms.ModelChoiceField(queryset=None, required=True,
                                     widget=forms.Select(attrs={
                                         "class": "form-control",
                                         "placeholder": "Select Subject"
                                     })
                                     )

    class Meta:
        model = Exam
        exclude = ('created_by',)

    def __init__(self, user, *args, **kwargs):
        super(Exam_form, self).__init__(*args, **kwargs)

        self.fields['subject'].queryset = Teacher_Subject.objects.filter(
            teacher_id=user.pk)
        self.choice = Teacher_Subject.objects.all()


class Exam_Form(forms.Form):
    name = forms.CharField(max_length=200, required=True,
                           widget=forms.TextInput(attrs={
                               "class": "form-control",
                               "placeholder": "Name of Exam"
                           }
                           )
                           )

    exam_date = forms.DateField(required=True,
                                widget=forms.SelectDateWidget(attrs={

                                    "placeholder": "Exam Date"
                                })
                                )

    subject = forms.ModelChoiceField(queryset=None, required=True,

                                     widget=forms.Select(attrs={
                                         "class": "form-control",
                                         "placeholder": "Select Subject"
                                     })
                                     )

    exam_time = forms.TimeField(
        widget=forms.TimeInput(attrs={
            "class": "form-control",
            "placeholder": "Time of exam"
        })
    )

    max_marks = forms.IntegerField(
        widget=forms.NumberInput(attrs={
            "class": "form-control",
            "placeholder": "Maximum marks"
        })
    )

    def __init__(self, user, *args, **kwargs):
        super(Exam_Form, self).__init__(*args, **kwargs)

        self.fields['subject'].queryset = Subject.objects.filter(
            subject_id__in=Teacher_Subject.objects.filter(teacher_id=user.pk).values('subject_id'))


class Create_Attendance_Form(forms.Form):
    subject = forms.ModelChoiceField(queryset=None, required=True,

                                     widget=forms.Select(attrs={
                                         "class": "form-control",
                                         "placeholder": "Select Subject"
                                     })
                                     )
    lecture_date = forms.DateField(required=True,
                                   widget=forms.SelectDateWidget(attrs={
                                       "placeholder": "Exam Date"
                                   })
                                   )

    def __init__(self, user, *args, **kwargs):
        super(Create_Attendance_Form, self).__init__(*args, **kwargs)

        self.fields['subject'].queryset = Subject.objects.filter(
            subject_id__in=Teacher_Subject.objects.filter(teacher_id = user.pk).values('subject_id'))


class student_attendance_form(forms.Form):

    attendance_id = forms.ModelChoiceField(queryset=None, required=True, widget=forms.Select(attrs={
                                         "class": "form-control",
                                         "placeholder": "Select Subject"
                                     })
                                     )

    students = forms.ModelMultipleChoiceField(queryset= None,  widget=forms.CheckboxSelectMultiple(attrs= {
        "checked" : "checked"
    } ))

   

    def __init__(self, user, *args, **kwargs):
        self.subject_id = kwargs.pop('subject_id')
        super(student_attendance_form, self).__init__(*args, **kwargs)

        self.fields['students'].queryset = StudentProfile.objects.filter(
            user__in = Student_Subject.objects.filter(subject_id = self.subject_id).values('student_id'))

        self.fields['attendance_id'].queryset = Attendance.objects.filter(subject_id = self.subject_id).order_by('-date_of_lecture')#desc order first 10



class student_exam_form(forms.Form):
    
    exam_id = forms.ModelChoiceField(queryset=None, required=True, widget=forms.Select(attrs={
                                         "class": "form-control",
                                         "placeholder": "Select Subject"
                                     })
                                     )

    def __init__(self,user,*args, **kwargs):
        self.subject_id = kwargs.pop('subject_id')
        super(student_exam_form, self).__init__(*args, **kwargs)
        students = StudentProfile.objects.filter(
            user__in = Student_Subject.objects.filter(subject_id = "BSC_CS_101").values('student_id'))
        
        self.fields['exam_id'].queryset = Exam.objects.filter(subject_id = "BSC_CS_101").order_by("-exam_date") 


        #dynamically create Integer field for each student
        for st in students:
            self.fields[str(st)] = forms.IntegerField(required = True, initial = 0)

        