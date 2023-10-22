from django.contrib import admin
from . import models


class CustomUserAdmin(admin.ModelAdmin):
    fieldsets = (
        (
            ("Enter User's email and password"),
            {
                "fields": (
                    "email",
                    "password",
                )
            },
        ),
        (("Enter User's username and phone"), {"fields": ("username", "phone")}),
        (("Enter User's name and surname"), {"fields": ("first_name", "last_name")}),
    )
    list_display = ("username", "email", "phone", "first_name", "last_name")
    search_fields = ("username",)
    list_filter = ("username",)


admin.site.register(models.CustomUser, CustomUserAdmin)
