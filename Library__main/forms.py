from django.contrib.auth.forms import UserCreationForm
from django import forms
from django.contrib.auth.models import User


class UserRegistrationForm(UserCreationForm):
    email = forms.EmailField(
        max_length=250, help_text="Enter a valid email address", required=True
    )

    class Meta:
        model = User
        fields = (
            "username",
            "email",
            "first_name",
            "last_name",
            "password1",
            "password2",
        )
