from django.contrib import admin
from . import models


class CustomUserAdmin(admin.ModelAdmin):
    # fieldsets = (
    #     (
    #         ("Email and password"),
    #         {
    #             "fields": (
    #                 "email",
    #                 "password",
    #             )
    #         },
    #     ),
    #     (("Username and phone"), {"fields": ("username", "phone")}),
    #     (("Name and surname"), {"fields": ("first_name", "last_name")}),

    # )
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
