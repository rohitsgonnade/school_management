from django.db import models

# Create your models here.

#from django.contrib.auth.models import AbstractBaseUser

from school_data.models import Department, Subject

from django.contrib.auth.models import AbstractUser
from django.conf import settings


class TeacherProfile(models.Model):
    user = models.OneToOneField(
        settings.AUTH_USER_MODEL, on_delete=models.CASCADE, primary_key=True)
    department = models.ForeignKey(Department, on_delete=models.CASCADE)

    subject_id = models.ManyToManyField(Subject, through='Teacher_Subject')

    def __str__(self):
        return self.user.first_name + " "+self.user.last_name


# customized User model
# in settings.py add - AUTH_USER_MODEL = '<app_name>.Custom_User'
class User(AbstractUser):
    roles = (
        ('s', 'student'),
        ('t', 'teacher'),
        ('p', 'parent'),
    )

    role = models.CharField(max_length=1, choices=roles, null=False)

    def __str__(self):
        return self.role + ":" + self.first_name + " "+self.last_name


class ParentProfile(models.Model):
    user = models.OneToOneField(
        settings.AUTH_USER_MODEL, on_delete=models.CASCADE, primary_key=True)
    address = models.TextField()

    def __str__(self):
        return self.user.first_name + " "+self.user.last_name


class StudentProfile(models.Model):
    user = models.OneToOneField(
        settings.AUTH_USER_MODEL, on_delete=models.CASCADE, primary_key=True)

    date_of_birth = models.DateField()

    # ForeignKey witn unique contraint = OneToOneField
    parent = models.ForeignKey(
        ParentProfile, on_delete=models.CASCADE, related_name='childrens')

    department_id = models.ForeignKey(Department, on_delete=models.CASCADE)
    date_of_admission = models.DateField(auto_now_add=True)
    subject_id = models.ManyToManyField(Subject, through='Student_Subject')

    def __str__(self):
        return str(self.user.id) + " "+self.user.first_name + " " + self.user.last_name


class Student_Subject(models.Model):
    student_id = models.ForeignKey(StudentProfile, on_delete=models.CASCADE)
    subject_id = models.ForeignKey(Subject, on_delete=models.CASCADE)
    date_joined = models.DateField(auto_now_add=True,  help_text="yy-mm-dd")
    date_completed = models.DateField(blank=True, null=True)

    class Meta:
        unique_together = ['student_id', 'subject_id']

    def __str__(self):
        return str(self.student_id) + " " + str(self.subject_id)


#
# class Teacher(AbstractBaseUser):
 #   teacher_id = models.UUIDField(default = uuid.uuid4, primary_key = True)
  #  user_name = models.CharField(unique = True,max_length = 200)
   # first_name = models.CharField("First Name ", max_length=100, help_text = "Enter First Name", null = False)
    #last_name = models.CharField("Last Name ", max_length=100, help_text = "Enter Last Name", null = False)
    #date_of_birth = models.DateField("DOB", null = False)
    #salary = models.FloatField("Enter salary", null= False)

    #subject_id = models.ManyToManyField(Subject, through='Teacher_Subject')

    #USERNAME_FIELD = 'user_name'

    # def __str__(self):
      #  return str(self.user_name)


class Teacher_Subject(models.Model):
    teacher_id = models.ForeignKey(TeacherProfile, on_delete=models.CASCADE)
    subject_id = models.ForeignKey(Subject, on_delete=models.CASCADE)
    date_joined = models.DateField(auto_now_add=True, help_text="yy-mm-dd")

    def __str__(self):
        return str(self.teacher_id) + " " + str(self.subject_id)


# dont forget to resgister models with admin.py



class Exam(models.Model):
    name = models.CharField(max_length = 200, null = False)
    exam_date = models.DateField()
    subject_id = models.ForeignKey(Subject, null = False, on_delete = models.CASCADE)
    exam_time = models.TimeField()
    max_marks = models.IntegerField("Maximum Marks", null= False)
    created_by = models.ForeignKey(TeacherProfile, null = False, on_delete = models.CASCADE)    

    class Meta:
        unique_together = ('subject_id', 'exam_date')

    def __str__(self):
        return self.name + " " + str(self.exam_date) + " "+ str(self.subject_id)

class Exam_Marks(models.Model):
    exam_id = models.ForeignKey(Exam, null = False, on_delete = models.CASCADE)
    student_id = models.ForeignKey(StudentProfile, null = False, on_delete = models.CASCADE)
    marks_obtained = models.IntegerField(null = False)

    class Meta:
        unique_together = ('student_id', 'exam_id')
    
    def __str__(self):
        return str(self.exam_id) + str(self.student_id)

class Attendance(models.Model):
    teacher_id = models.ForeignKey(TeacherProfile, on_delete = models.CASCADE, null = False)
    subject_id = models.ForeignKey(Subject, on_delete = models.CASCADE, null = False)
    date_of_lecture = models.DateField(null = False)

    class Meta:
        unique_together = ('subject_id', 'teacher_id','date_of_lecture')
       

    def __str__(self):
        return str(self.date_of_lecture) + " : " + str(self.subject_id)

class Student_Attendance(models.Model):
    student_id = models.ForeignKey(StudentProfile, on_delete = models.CASCADE)
    attendance_id = models.ForeignKey(Attendance, on_delete = models.CASCADE)
    present = models.BooleanField(null = False)

    class Meta:
        unique_together = ('student_id', 'attendance_id')

    def __str__(self):
        return str(self.attendance_id)