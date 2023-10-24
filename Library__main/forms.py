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


class UserEditForm(forms.ModelForm):
    class Meta:
        model = models.CustomUser
        fields = (
            "username",
            "first_name",
            "last_name",
            "phone",
        )

    phone = forms.CharField(
        max_length=12,
        required=False,
        help_text="Enter your phone, e.g.: +11111111111",
        label="Phone number",
    )


class BookForm(forms.ModelForm):
    class Meta:
        model = models.Book
        fields = (
            "title",
            "author",
            "year_published",
            "genre",
            "publisher",
            "description",
            "status",
        )

    title = forms.CharField(
        max_length=100,
        required=True,
        help_text="Enter the title of the book.",
        label="Book title",
    )

    author = forms.CharField(
        max_length=100,
        required=True,
        help_text="Enter the author of the book.",
        label="Book author",
    )

    year_published = forms.IntegerField(
        required=True,
        widget=forms.NumberInput,
        min_value=1700,
        max_value=2023,
        initial=2000,
        help_text="Enter the year of publication of the book.",
        label="Year of publication",
    )

    genre = forms.ChoiceField(
        choices=models.Book.genres,
        required=True,
        help_text="Select the genre of the book.",
        label="Book genre",
    )

    publisher = forms.CharField(
        max_length=100,
        required=False,
        initial="NYC, Official Book Publisher",
        help_text="Enter the name of the publisher.",
        label="Book publisher",
    )

    description = forms.CharField(
        max_length=1000,
        required=False,
        help_text="Enter the description of the book.",
        label="Book description",
        widget=forms.Textarea,
    )

    statusOption = [
        ("Available", "Available"),
        ("Not Available", "Not Available"),
    ]

    status = forms.ChoiceField(
        choices=statusOption,
        required=True,
        help_text="Select the book availability.",
        label="Book availability",
    )


class BookEditForm(BookForm):
    class Meta:
        model = models.Book
        fields = (
            "title",
            "author",
            "year_published",
            "genre",
            "publisher",
            "description",
            "status",
        )
