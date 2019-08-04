from .models import ParentProfile, StudentProfile, User, Exam, TeacherProfile
from rest_framework import serializers


from django.contrib.auth import authenticate


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'


class LoginUserSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField()

    def validate(self, data):
        user = authenticate(**data)
        if user and user.is_active:
            return user
        raise serializers.ValidationError(
            "Unable to log in with provided credentials.")


# 1 parent many childrens
class ParentProfileSerializer(serializers.ModelSerializer):
    username = serializers.CharField(source='user.username', read_only=True)
    first_name = serializers.CharField(
        source='user.first_name', read_only=True)
    last_name = serializers.CharField(source='user.last_name', read_only=True)

    class Meta:
        model = ParentProfile
        fields = '__all__'


class StudentProfileSerializer(serializers.ModelSerializer):
    username = serializers.CharField(source='user.username', read_only=True)
    first_name = serializers.CharField(
        source='user.first_name', read_only=True)
    last_name = serializers.CharField(source='user.last_name', read_only=True)

    # get department name
    department = serializers.CharField(source='department_id', read_only=True)

    # get parent name
    parents = serializers.CharField(source='parent', read_only=True)

    # get subjects related to the student
    subjects = serializers.CharField(source='subject_id', read_only=True)

    class Meta:
        model = StudentProfile
        fields = '__all__'


class TeacherProfileSerializer(serializers.ModelSerializer):
    username = serializers.CharField(source='user.username', read_only=True)
    first_name = serializers.CharField(source='user.first_name', read_only = True)
    last_name = serializers.CharField(source = 'user.last_name', read_only = True)

    # get department name
    department = serializers.CharField(source='department_id', read_only = True)

     # get subjects related 
    subjects = serializers.CharField(source='subject_id', read_only=True)

    class Meta:
        model = TeacherProfile
        fields = '__all__'


class ExamSerializer(serializers.ModelSerializer):

    subject = serializers.CharField(source='subject_id', read_only= True)
    creator = serializers.CharField(source='created_by', read_only = True)
    
    class Meta:
        model = Exam
        fields = '__all__'
        