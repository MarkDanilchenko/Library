from django.urls import path, re_path
from django.views.generic import TemplateView
from . import views

urlpatterns = [
    path('', TemplateView.as_view(template_name='index.html')),
    path('books/', TemplateView.as_view(template_name='books.html')),
    path('members/', TemplateView.as_view(template_name='members.html')),
]