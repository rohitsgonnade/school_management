# Generated by Django 2.2.3 on 2019-08-03 23:18

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0006_attendance'),
    ]

    operations = [
        migrations.CreateModel(
            name='Student_Attendance',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('attendance_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='users.Attendance')),
                ('student_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='users.StudentProfile')),
            ],
            options={
                'unique_together': {('student_id', 'attendance_id')},
            },
        ),
    ]
