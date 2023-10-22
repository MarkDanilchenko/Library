from django.contrib.auth.forms import UserCreationForm
from django import forms
from django.contrib.auth.models import User, AbstractUser
from . import models


class UserRegistrationForm(UserCreationForm):
    class Meta:
        model = models.CustomUser
        fields = (
            "username",
            "email",
            "first_name",
            "last_name",
            "password1",
            "password2",
            "phone",
        )

    email = forms.EmailField(
        max_length=250,
        required=True,
        help_text="Enter a valid email address, e.g.: 5l6vA@example.com",
        label="Email",
    )

    phone = forms.CharField(
        max_length=12,
        required=False,
        help_text="Enter your phone, e.g.: +11111111111",
        label="Phone number",
    )
