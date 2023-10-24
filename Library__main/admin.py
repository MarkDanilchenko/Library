from django.contrib import admin
from . import models
from django.contrib.auth.admin import UserAdmin


class CustomUserAdmin(UserAdmin):
    list_display = (
        "username",
        "email",
        "phone",
        "first_name",
        "last_name",
        "date_joined",
    )
    search_fields = ("username",)
    list_filter = ("username", "date_joined")


admin.site.register(models.CustomUser, CustomUserAdmin)


class BookAdmin(admin.ModelAdmin):
    list_display = (
        "title",
        "author",
        "year_published",
        "genre",
        "publisher",
        "description",
        "status",
    )
    search_fields = ("title", "author", "year_published", "genre", "status")
    list_filter = ("title", "author", "year_published", "genre", "status")


admin.site.register(models.Book, BookAdmin)


class BookInstanceAdmin(admin.ModelAdmin):
    list_display = ("book", "user", "due_back")
    search_fields = "book__title",
    list_filter = "due_back",


admin.site.register(models.BookInstance, BookInstanceAdmin)
