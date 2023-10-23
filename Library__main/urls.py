from django.urls import path, re_path
from django.views.generic import TemplateView
from . import views

urlpatterns = [
    path('', TemplateView.as_view(template_name='index.html')),
    # members
    path('members/', TemplateView.as_view(template_name='members__dl.html')),
    path('members__list/', views.members__list, name='members__list'),
    re_path(r'members__edit/(?P<id>\d+)', views.members__edit, name='members__edit'),
    re_path(r'members__delete/(?P<id>\d+)', views.members__delete, name='members__delete'),
    # books
    path('books/', TemplateView.as_view(template_name='books__dl.html')),
    path('books__list/', views.books__list, name='books__list'),
    path('books__add/', views.books__add, name='books__add'),
    re_path(r'books__edit/(?P<id>\d+)', views.books__edit, name='books__edit'),
    re_path(r'books__delete/(?P<id>\d+)', views.books__delete, name='books__delete'),
]