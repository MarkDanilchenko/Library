# Generated by Django 4.2.6 on 2023-10-23 18:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Library__main', '0006_alter_bookinstance_due_back_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='bookinstance',
            name='status',
        ),
        migrations.AlterField(
            model_name='bookinstance',
            name='id',
            field=models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID'),
        ),
    ]
