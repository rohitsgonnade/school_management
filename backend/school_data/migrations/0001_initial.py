# Generated by Django 2.2.3 on 2019-07-31 11:30

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Courses',
            fields=[
                ('name', models.CharField(help_text='Name of course', max_length=100)),
                ('course_id', models.CharField(help_text='Enter course ID', max_length=20, primary_key=True, serialize=False, verbose_name='Course ID')),
            ],
        ),
        migrations.CreateModel(
            name='Department',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='Subject',
            fields=[
                ('subject_id', models.CharField(help_text='Enter Subject name: e.g. BSC_CS_101', max_length=60, primary_key=True, serialize=False)),
                ('subject_name', models.CharField(max_length=200)),
                ('course_id', models.ForeignKey(help_text='Select Course', on_delete=django.db.models.deletion.CASCADE, to='school_data.Courses')),
            ],
        ),
        migrations.AddField(
            model_name='courses',
            name='department',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='school_data.Department'),
        ),
    ]
