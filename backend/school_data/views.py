import json
from users.models import StudentProfile, ParentProfile, TeacherProfile, User
from users.serializers import StudentProfileSerializer, TeacherProfileSerializer
import datetime
from django.shortcuts import render

# Create your views here.
from .models import Department  

from .serializer import DepartmentSerializer
from rest_framework import status, permissions
from rest_framework.decorators import api_view, permission_classes
from django.http import JsonResponse

from django.contrib.auth.decorators import login_required
from rest_framework.decorators import api_view, permission_classes


@api_view(['GET'])
@permission_classes(permissions.IsAuthenticated,)
def departmentAPI(request):

    if request.user.is_superuser:

        if request.method == "GET":
            dept = Department.objects.all()

            serializer = DepartmentSerializer(dept, many=True)

            return JsonResponse(serializer.data, safe=False)
    else:
        return JsonResponse({'error': 'You are not authorized to do this operation.'}, status=status.HTTP_401_UNAUTHORIZED)

# @api_view(['GET'])
# @permission_classes(permissions.IsAuthenticated)
# def courseAPI(request):


# this is APIView
# dowsn't matter if u write function of class based view
# but I'm getting problem using class based
# what if I want to have perticular department
# I dont know how to implement it in class based

# from django.http import Http404
# from rest_framework.views import APIView

# class DepartmentAPI(APIView):
    # get  department
    # def get(self, request,format = None):

 #   if 'name' in request.GET:
  #      depart = Department.objects.filter(name=request.GET['name'])
   # else:
        #    depart = Department.objects.all()

        # serializer = DepartmentSerializer(depart, many= True)
        # return Response(serializer.data)

    # we can fire this query on terminal to add dept
    # curl --request POST \
    # >   --url http://localhost:8000/school/department/ \
    # >   --header 'content-type: application/json' \
    # >   --data '{
    # >     "name": "Arts"
    # > }'

    # save departtment
    # def post(self, request, format = None):
    #    serializer = DepartmentSerializer(data = request.data)
    #    if serializer.is_valid():
    #        serializer.save()

 #       return Response(serializer.data, status= status.HTTP_201_CREATED)

  #  return Response(serializer.errors, status = status.HTTP_400_BAD_REQUEST)


