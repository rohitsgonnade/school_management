# Generated by Django 2.2.3 on 2019-08-02 06:34

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('school_data', '0006_auto_20190802_0633'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='exam',
            name='exam_time',
        ),
    ]
