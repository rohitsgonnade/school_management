#we’re going to need to do is define a custom JWT response payload handler which includes the user’s serialized data.

from users.serializers import UserSerializer

def my_jwt_response_handler(token, user = None, request = None):
    return {
        'token':token,
        'user':UserSerializer(user, context={'request': request}).data        
    }


#All this is doing is adding a new ‘user’ field with the user’s serialized data when a token is generated. This is going to be our new default JWT response handler, which we can set up by adding a little bit to our settings.py file: