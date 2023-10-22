from django.contrib.auth import authenticate, login
from django.db import transaction
from django.shortcuts import render, redirect
from . import forms, models
from fuzzywuzzy import fuzz
from fuzzywuzzy import process


# user registration
# user registration
# user registration
def registration(request):
    if request.method == "POST":
        form = forms.UserRegistrationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get("username")
            userpassword = form.cleaned_data.get("password1")
            user = authenticate(username=username, password=userpassword)
            login(request, user)
            return redirect("/")
    else:
        form = forms.UserRegistrationForm()
    return render(
        request,
        "registration/registration.html",
        {"form": form},
    )
