from django.contrib import admin

# Register your models here.

from .models import StudentProfile, Student_Subject, ParentProfile, TeacherProfile, Teacher_Subject, User, Exam, Attendance, Student_Attendance, Exam_Marks

admin.site.register(Student_Subject)
admin.site.register(StudentProfile)
admin.site.register(ParentProfile)
admin.site.register(Teacher_Subject)
admin.site.register(TeacherProfile)
admin.site.register(User)
admin.site.register(Exam)
admin.site.register(Attendance)
admin.site.register(Student_Attendance)
admin.site.register(Exam_Marks)