# myapp/views.py

from rest_framework.views import APIView
from django.contrib.auth.hashers import make_password
from rest_framework import generics, status, serializers
from rest_framework.decorators import api_view,permission_classes,authentication_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework_simplejwt.tokens import RefreshToken
from django.http import JsonResponse
from .models import Users,Category,Product, ProductImages
from .serializers import UsersSerializer,LoginSerializer,CategorySerializer,ProductSerializer, ProductImagesSerializer
from .utils import verify_jwt_token
from django.db.models import Q
# @authentication_classes([])
# @permission_classes([IsAuthenticated])

def home(request):
    data = {
        'message': 'Welcome to home',
        'status': 'success',
    }
    return JsonResponse(data)

def json_data(request):
    data = {
        'message': 'Hello, this is JSON data!',
        'status': 'success',
    }
    return JsonResponse(data)

class RegisterView(generics.CreateAPIView):
    queryset = Users.objects.all()
    serializer_class = UsersSerializer

    def create(self, request, *args, **kwargs):
        # Create a mutable copy of the request data
        mutable_request_data = request.data.copy()

        # Extract the password from the request data
        password = mutable_request_data.get('password')

        # Hash the password using make_password
        hashed_password = make_password(password)

        # Replace the original password with the hashed one
        mutable_request_data['password'] = hashed_password

        serializer = self.get_serializer(data=mutable_request_data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()

        # Serialize the user data
        user_serializer = self.serializer_class(user)
        
        # Generate JWT tokens
        refresh = RefreshToken.for_user(user)
        access_token = str(refresh.access_token)
        refresh_token = str(refresh)

        return Response({
            'message': 'User registered successfully',
            'data': user_serializer.data,
            'access_token': access_token,
            'refresh_token': refresh_token
        }, status=status.HTTP_201_CREATED)


class LoginView(generics.CreateAPIView):
    serializer_class = LoginSerializer

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data['user']

        # Generate JWT tokens
        refresh = RefreshToken.for_user(user)
        access_token = str(refresh.access_token)
        refresh_token = str(refresh)

        user_serializer = UsersSerializer(user)

        return Response({
            'message': 'Login successful',
            'user': user_serializer.data,
            'access_token': access_token,
            'refresh_token': refresh_token
        }, status=status.HTTP_200_OK)


@authentication_classes([])
@permission_classes([])
class CategoryListView(generics.ListCreateAPIView):
    queryset = Category.objects.order_by('-id')
    serializer_class = CategorySerializer
    # permission_classes = [permissions.IsAuthenticated]

    def list(self, request, *args, **kwargs):
        decoded_payload = verify_jwt_token(request)

        if isinstance(decoded_payload, Response):
            return decoded_payload

        queryset = self.filter_queryset(self.get_queryset())
        serializer = self.get_serializer(queryset, many=True)

        return Response({
            'message': 'Categories retrieved successfully',
            'data': serializer.data,
        })

    def create(self, request, *args, **kwargs):
        decoded_payload = verify_jwt_token(request)

        if isinstance(decoded_payload, Response):
            return decoded_payload

        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)

        return Response({
            'message': 'Category created successfully',
            'data': serializer.data,
        }, status=status.HTTP_201_CREATED, headers=headers)

@authentication_classes([])
@permission_classes([])
class CategoryDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer

    def retrieve(self, request, *args, **kwargs):
        decoded_payload = verify_jwt_token(request)

        if isinstance(decoded_payload, Response):
            return decoded_payload

        instance = self.get_object()
        serializer = self.get_serializer(instance)
        return Response({
            'message': 'Category retrieved successfully',
            'data': serializer.data,
        })

    def update(self, request, *args, **kwargs):
        decoded_payload = verify_jwt_token(request)

        if isinstance(decoded_payload, Response):
            return decoded_payload

        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)
        return Response({
            'message': 'Category updated successfully',
            'data': serializer.data,
        })

    def destroy(self, request, *args, **kwargs):
        decoded_payload = verify_jwt_token(request)

        if isinstance(decoded_payload, Response):
            return decoded_payload

        instance = self.get_object()
        self.perform_destroy(instance)
        return Response({
            'message': 'Category deleted successfully',
            'data': None,
        }, status=status.HTTP_204_NO_CONTENT)


@authentication_classes([])
@permission_classes([])
class ProductSearchView(generics.ListAPIView):
    serializer_class = ProductSerializer

    def get_queryset(self):
        search_query = self.request.query_params.get('product_name', '')
        queryset = Product.objects.filter(product_name__icontains=search_query)
        return queryset


    def list(self, request, *args, **kwargs):
        decoded_payload = verify_jwt_token(request)

        if isinstance(decoded_payload, Response):
            return decoded_payload

        queryset = self.get_queryset()
        serializer = self.get_serializer(queryset, many=True)

        # Add images and category information to each product in the response
        response_data = []
        for product_data in serializer.data:
            product_id = product_data['id']

            # Get images related to the current product
            images_queryset = ProductImages.objects.filter(product_id=product_id)
            images_serializer = ProductImagesSerializer(images_queryset, many=True)
            product_data['images'] = images_serializer.data

            # Add category_name to the response
            category_id = product_data.get('product_category_id')
            if category_id:
                category = Category.objects.filter(id=category_id).first()
                if category:
                    product_data['category_name'] = category.category_name

            response_data.append(product_data)

        return Response({'message': 'Product search results retrieved successfully', 'data': response_data}, status=status.HTTP_200_OK)
@authentication_classes([])
@permission_classes([])
class ProductListView(generics.ListCreateAPIView):
    queryset = Product.objects.order_by('-id')
    serializer_class = ProductSerializer

    def list(self, request, *args, **kwargs):
        decoded_payload = verify_jwt_token(request)

        if isinstance(decoded_payload, Response):
            return decoded_payload

        products = self.get_queryset()
        serializer = self.get_serializer(products, many=True)

        # Add images and category information to each product in the response
        response_data = []
        for product_data in serializer.data:
            product_id = product_data['id']

            # Get images related to the current product
            images_queryset = ProductImages.objects.filter(product_id=product_id)
            images_serializer = ProductImagesSerializer(images_queryset, many=True)
            product_data['images'] = images_serializer.data

            # Add category_name to the response
            category_id = product_data.get('product_category_id')
            if category_id:
                category = Category.objects.filter(id=category_id).first()
                if category:
                    product_data['category_name'] = category.category_name

            response_data.append(product_data)

        return Response({'message': 'Product list retrieved successfully', 'data': response_data}, status=status.HTTP_200_OK)

    def create(self, request, *args, **kwargs):
        decoded_payload = verify_jwt_token(request)

        if isinstance(decoded_payload, Response):
            return decoded_payload

        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        product = serializer.save()

        images_data = request.FILES.getlist('images')
        for image_data in images_data:
            # Create a ProductImages instance
            ProductImages.objects.create(
                product_id=product.id,
                user_id=product.user_id,
                category_id=product.product_category_id,
                product_image=image_data
            )

        response_data = serializer.data

        images_queryset = ProductImages.objects.filter(product_id=product.id)
        images_serializer = ProductImagesSerializer(images_queryset, many=True)
        response_data['images'] = images_serializer.data

        category_id = product.product_category_id
        if category_id:
            category = Category.objects.filter(id=category_id).first()
            if category:
                response_data['category_name'] = category.category_name

        return Response({'message': 'Product created successfully', 'data': response_data}, status=status.HTTP_201_CREATED)

@authentication_classes([])
@permission_classes([])
class ProductDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer

    def retrieve(self, request, *args, **kwargs):
        decoded_payload = verify_jwt_token(request)

        if isinstance(decoded_payload, Response):
            return decoded_payload

        product = self.get_object()
        serializer = self.get_serializer(product)

        # Add images and category information to the response
        response_data = serializer.data

        images_queryset = ProductImages.objects.filter(product_id=product.id)
        images_serializer = ProductImagesSerializer(images_queryset, many=True)
        response_data['images'] = images_serializer.data

        # Add category_name to the response
        category_id = product.product_category_id
        if category_id:
            category = Category.objects.filter(id=category_id).first()
            if category:
                response_data['category_name'] = category.category_name

        return Response({'message': 'Product retrieved successfully', 'data': response_data}, status=status.HTTP_200_OK)

    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)

        # Handle images update
        images_data = request.FILES.getlist('images')
        for image_data in images_data:
            # Create a ProductImages instance
            ProductImages.objects.create(
                product_id=instance.id,
                user_id=instance.user_id,
                category_id=instance.product_category_id,
                product_image=image_data
            )

        # Retrieve the updated product with images and category information
        updated_product = self.get_object()
        serializer = self.get_serializer(updated_product)
        response_data = serializer.data

        images_queryset = ProductImages.objects.filter(product_id=updated_product.id)
        images_serializer = ProductImagesSerializer(images_queryset, many=True)
        response_data['images'] = images_serializer.data

        category_id = updated_product.product_category_id
        if category_id:
            category = Category.objects.filter(id=category_id).first()
            if category:
                response_data['category_name'] = category.category_name

        return Response({'message': 'Product updated successfully', 'data': response_data}, status=status.HTTP_200_OK)

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        return Response({'message': 'Product deleted successfully'}, status=status.HTTP_204_NO_CONTENT)


@authentication_classes([])
@permission_classes([])
class ProductImageDeleteView(generics.DestroyAPIView):
    queryset = ProductImages.objects.all()  # Adjust queryset based on your needs
    serializer_class = ProductImagesSerializer
    # permission_classes = [permissions.IsAuthenticated]  # Adjust permissions as needed

    def destroy(self, request, *args, **kwargs):
        try:
            image_id = kwargs.get('pk')  # Get the image id from the URL
            instance = self.queryset.get(id=image_id)
            self.perform_destroy(instance)
            return Response({'message': 'Product image deleted successfully'}, status=status.HTTP_204_NO_CONTENT)
        except ProductImages.DoesNotExist:
            return Response({'error': 'Product image not found'}, status=status.HTTP_404_NOT_FOUND)
        except Exception as e:
            return Response({'error': str(e)}, status=status.HTTP_400_BAD_REQUEST)