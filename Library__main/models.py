from django.contrib.auth.models import User, AbstractUser
from django.core.exceptions import ValidationError
from django.core.validators import MaxValueValidator, MinValueValidator
from django.db import models
import re, datetime


# custom validators
# custom validators
# custom validators
def bookNameValidator(value):
    if re.search("[0-9]|[#$%&()*+-/;<=>?@\[\]^_`{|}~]", value):
        raise ValidationError("Book title should not contain any special characters.")
    else:
        return value


def nameValidator(value):
    if re.search("\P{Letter}", value, re.U):
        raise ValidationError(
            "Name should not contain any special characters except letters."
        )
    else:
        return value


def phoneValidator(value):
    pattern = r"^\+[0-9]{11}$"
    try:
        re.match(pattern, value).group()
        return value
    except:
        raise ValidationError("Enter phone in the format +00000000000")


# models
# models
# models
class Book(models.Model):
    title = models.CharField(
        max_length=100,
        validators=[bookNameValidator],
        help_text="Enter the title of the book.",
        verbose_name="Book title",
    )

    description = models.TextField(
        blank=True,
        help_text="Enter the description of the book.",
        verbose_name="Book description",
    )

    author = models.CharField(
        max_length=100,
        validators=[nameValidator],
        help_text="Enter the author of the book.",
        verbose_name="Book author",
    )
    year_published = models.IntegerField(
        validators=[MinValueValidator(1900), MaxValueValidator(2023)],
        help_text="Enter the year of publication of the book.",
        verbose_name="Year of publication",
    )

    genres = [
        ("Classic", "Classic"),
        ("Fantastic", "Fantastic"),
        ("Detective", "Detective"),
        ("Fairy tales", "Fairy tales"),
        ("Horror", "Horror"),
        ("Romance", "Romance"),
        ("Science fiction", "Science fiction"),
        ("Thriller", "Thriller"),
        ("Other", "Other"),
    ]
    genre = models.CharField(
        max_length=100,
        choices=genres,
        default="Other",
        help_text="Select the genre of the book.",
        verbose_name="Book genre",
    )
    publisher = models.CharField(
        max_length=100,
        blank=True,
        help_text="Enter the name of the publisher.",
        verbose_name="Book publisher",
    )

    def __str__(self):
        return f"{self.title} by {self.author} ({self.year_published})"


class CustomUser(AbstractUser):
    phone = models.CharField(
        max_length=12,
        validators=[phoneValidator],
        help_text="Enter the User's phone number",
        verbose_name="Phone number",
        blank=True,
    )

    def __str__(self):
        return self.username
