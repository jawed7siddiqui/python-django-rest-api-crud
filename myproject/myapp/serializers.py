# myapp/serializers.py

from django.contrib.auth import get_user_model
from django.contrib.auth.hashers import check_password
from rest_framework import serializers
from django.contrib.auth.hashers import check_password
from django.contrib.auth import authenticate
from .models import Users,Category,Product, ProductImages
from django.conf import settings

class UsersSerializer(serializers.ModelSerializer):
    class Meta:
        model = Users
        fields = '__all__'

class LoginSerializer(serializers.Serializer):
    email = serializers.EmailField()
    password = serializers.CharField()

    def validate(self, data):
        email = data.get('email')
        password = data.get('password')

        if email and password:
            try:
                user = Users.objects.get(email=email)
            except Users.DoesNotExist:
                raise serializers.ValidationError('User not found.')

            # Check the hashed password
            if check_password(password, user.password):
                data['user'] = user
            else:
                raise serializers.ValidationError('Invalid password.')
        else:
            raise serializers.ValidationError('Must include "email" and "password".')

        return data

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'category_name']

class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = '__all__'

class ProductImagesSerializer(serializers.ModelSerializer):
    # Add a new field 'image_url' to include the full URL
    image_url = serializers.SerializerMethodField()

    class Meta:
        model = ProductImages
        fields = ['image_url']

    def get_image_url(self, obj):
        # Construct the full URL using MEDIA_URL
        return f"{settings.MEDIA_URL}{obj.product_image}"