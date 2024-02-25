# utils.py
from jose import jwt
from django.conf import settings
from rest_framework.response import Response
from rest_framework import status

def verify_jwt_token(request):
    authorization_header = request.headers.get("Authorization")

    if not authorization_header or not authorization_header.startswith("Bearer "):
        return Response({"detail": "Authorization header missing or invalid"}, status=status.HTTP_401_UNAUTHORIZED)

    token = authorization_header.split(" ")[1]

    try:
        decoded_payload = jwt.decode(token, settings.SECRET_KEY, algorithms=["HS256"])
        return decoded_payload
    except jwt.ExpiredSignatureError:
        return Response({"detail": "Token has expired"}, status=status.HTTP_401_UNAUTHORIZED)
    except jwt.JWTError:
        return Response({"detail": "Invalid token"}, status=status.HTTP_401_UNAUTHORIZED)
