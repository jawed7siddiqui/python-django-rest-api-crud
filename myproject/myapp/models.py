# myapp/models.py

from django.db import models
# from django.contrib.auth.models import AbstractBaseUser, BaseUserManager


class Users(models.Model):
    id = models.AutoField(primary_key=True)
    f_name = models.CharField(max_length=255)
    l_name = models.CharField(max_length=255)
    dob = models.DateField()
    email = models.EmailField(unique=True)
    phonenumber = models.CharField(max_length=15)
    username = models.CharField(max_length=50, unique=False)
    password = models.CharField(max_length=255)
    joining_date = models.DateField()
    status = models.CharField(max_length=20)
    created_timestamp = models.DateTimeField(auto_now_add=True)
    updated_timestamp = models.DateTimeField(auto_now=True)


class Product(models.Model):
    id = models.AutoField(primary_key=True)
    product_name = models.CharField(max_length=255)
    product_desc = models.TextField()
    product_category_id = models.PositiveIntegerField()  # Added field for category_id
    product_specification = models.TextField()
    product_actual_cost = models.DecimalField(max_digits=10, decimal_places=2)
    product_actual_cost_currency = models.CharField(max_length=3)
    product_status = models.CharField(max_length=20)
    user_id = models.PositiveIntegerField()  # Added field for user_id

class ProductImages(models.Model):
    product_id = models.PositiveIntegerField()  # Added field for product_id
    user_id = models.PositiveIntegerField()  # Added field for user_id
    category_id = models.PositiveIntegerField()  # Added field for category_id
    product_image = models.ImageField(upload_to='product_images/')

class Category(models.Model):
    id = models.AutoField(primary_key=True)
    category_name = models.CharField(max_length=255, unique=True)
