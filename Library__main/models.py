from django.contrib.auth.models import User, AbstractUser
from django.core.exceptions import ValidationError
from django.core.validators import MaxValueValidator, MinValueValidator
from django.db import models
import re, datetime, uuid


# custom validators
# custom validators
# custom validators
def bookNameValidator(value):
    if re.search("[#$%&()*+/<=>@\[\]^_`{|}~]", value):
        raise ValidationError("Book title should not contain any special characters.")
    else:
        return value


def nameValidator(value):
    if re.search("[^a-zA-Zа-яА-Я\. ]", value):
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
        max_length=1000,
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
        validators=[MinValueValidator(1700), MaxValueValidator(2023)],
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

    class Meta:
        ordering = ["title"]

    def __str__(self):
        return f"{self.title} by {self.author} ({self.year_published})"


class CustomUser(AbstractUser):
    phone = models.CharField(
        max_length=12,
        validators=[phoneValidator],
        help_text="Enter user's phone, e.g.: +11111111111",
        verbose_name="Phone number",
        blank=True,
    )

    def __str__(self):
        return self.username


class BookInstance(models.Model):
    id = models.UUIDField(
        primary_key=True,
        default=uuid.uuid4,
        editable=False,
        unique=True,
        help_text="Unique ID for this particular book across whole library",
    )
    book = models.ForeignKey(Book, on_delete=models.SET_NULL, null=True)
    user = models.ForeignKey(CustomUser, on_delete=models.SET_NULL, null=True)
    due_back = models.DateField(null=True, blank=True)

    LOAN_STATUS = (
        ("m", "Maintenance"),
        ("o", "On loan"),
        ("a", "Available"),
        ("r", "Reserved"),
    )

    status = models.CharField(
        max_length=1,
        choices=LOAN_STATUS,
        blank=True,
        default="m",
        help_text="Book availability",
        verbose_name="Book status",
    )

    class Meta:
        ordering = ["due_back"]

    def is_overdue(self):
        if self.due_back and datetime.date.today() > self.due_back:
            return True
        return False

    def __str__(self):
        return f"{self.id} ({self.book.title})"
