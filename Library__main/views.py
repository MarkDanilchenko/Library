from django.contrib.auth import authenticate, login
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


# members functions
# members functions
# members functions
def members__list(request):
    try:
        registeredMembers = models.CustomUser.objects.filter(is_superuser=0)
        if registeredMembers:
            return render(
                request, "members__list.html", {"registeredMembers": registeredMembers}
            )
        else:
            raise Exception
    except:
        return render(request, "members__list.html")


def members__edit(request, id):
    member = models.CustomUser.objects.get(id=id)
    form = forms.UserEditForm(instance=member)
    if request.method == "POST":
        form = forms.UserEditForm(request.POST, instance=member)
        if form.is_valid():
            form.save()
            return redirect("/members__list")
    return render(request, "members__edit.html", {"form": form})


def members__delete(request, id):
    try:
        if models.CustomUser.objects.filter(id=id).exists():
            models.CustomUser.objects.get(id=id).delete()
        return redirect("/members__list")
    except:
        return redirect("/members__list")


# books functions
# books functions
# books functions
def books__list(request):
    try:
        all_books = models.Book.objects.all()
        if all_books:
            return render(request, "books__list.html", {"all_books": all_books})
        else:
            raise Exception
    except:
        return render(request, "books__list.html")


def books__add(request):
    if request.method == "POST":
        form = forms.BookForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect("/books__list")
    else:
        form = forms.BookForm()
    return render(request, "books__add.html", {"form": form})


def books__edit(request, id):
    book = models.Book.objects.get(id=id)
    form = forms.BookEditForm(instance=book)
    if request.method == "POST":
        form = forms.BookEditForm(request.POST, instance=book)
        if form.is_valid():
            form.save()
            return redirect("/books__list")
    return render(request, "books__edit.html", {"form": form})


def books__delete(request, id):
    try:
        if models.Book.objects.filter(id=id).exists():
            models.Book.objects.get(id=id).delete()
        return redirect("/books__list")
    except:
        return redirect("/books__list")
