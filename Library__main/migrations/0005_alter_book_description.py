# Generated by Django 4.2.6 on 2023-10-23 11:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Library__main', '0004_alter_book_year_published_alter_customuser_phone'),
    ]

    operations = [
        migrations.AlterField(
            model_name='book',
            name='description',
            field=models.TextField(blank=True, help_text='Enter the description of the book.', max_length=1000, verbose_name='Book description'),
        ),
    ]
