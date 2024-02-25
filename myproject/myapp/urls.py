# myapp/urls.py

from django.urls import path
from .views import json_data
from .views import home
from .views import RegisterView,LoginView,CategoryListView, CategoryDetailView,ProductListView,ProductDetailView,ProductImageDeleteView,ProductSearchView

urlpatterns = [
    path('json-data/', json_data, name='json_data'),
    path('', home, name='home'),
    path('register/', RegisterView.as_view(), name='register'),
    path('login/', LoginView.as_view(), name='login'),
    path('categories/', CategoryListView.as_view(), name='category-list'),
    path('categories/<int:pk>/', CategoryDetailView.as_view(), name='category-detail'),
    path('products/', ProductListView.as_view(), name='products-list'),
    path('products/<int:pk>/', ProductDetailView.as_view(), name='products-detail'),
    path('api/product-images/<int:pk>/delete/', ProductImageDeleteView.as_view(), name='product-image-delete'),
    path('api/products/search/', ProductSearchView.as_view(), name='product-search'),
]
