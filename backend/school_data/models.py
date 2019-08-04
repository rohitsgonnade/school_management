from django.db import models




# Create your models here.
class Department(models.Model):
    name = models.CharField(max_length = 100, unique = True, blank = False, null = False)

    def __str__(self):
        return self.name

class Courses(models.Model):
    #course has 1 dept but dept has many courses
    department = models.ForeignKey(Department, on_delete = models.CASCADE, null=False)
    name = models.CharField(max_length = 100, null = False, help_text = "Name of course",  blank = False)
    course_id = models.CharField("Course ID", max_length = 20, primary_key = True, help_text="Enter course ID")

    def __str__(self):
        return self.course_id


class Subject(models.Model):
    #subject is associated with 1 course and course have many subjects
    course_id = models.ForeignKey(Courses, on_delete = models.CASCADE, null = False, help_text = "Select Course")
    subject_id = models.CharField(max_length = 60, primary_key = True, help_text = "Enter Subject name: e.g. BSC_CS_101")
    subject_name = models.CharField(max_length = 200, null = False, blank = False)

    def __str__(self):
        return self.subject_id 



