# Generated by Django 2.2.3 on 2019-08-02 06:31

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('school_data', '0003_remove_exam_exam_time'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Exam',
        ),
    ]
