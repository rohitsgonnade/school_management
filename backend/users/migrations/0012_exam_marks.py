# Generated by Django 2.2.3 on 2019-08-04 10:42

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0011_student_attendance'),
    ]

    operations = [
        migrations.CreateModel(
            name='Exam_Marks',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('marks_obtained', models.IntegerField()),
                ('exam_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='users.Exam')),
                ('student_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='users.StudentProfile')),
            ],
            options={
                'unique_together': {('student_id', 'exam_id')},
            },
        ),
    ]
