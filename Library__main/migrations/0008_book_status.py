# Generated by Django 4.2.6 on 2023-10-23 20:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Library__main', '0007_remove_bookinstance_status_alter_bookinstance_id'),
    ]

    operations = [
        migrations.AddField(
            model_name='book',
            name='status',
            field=models.CharField(choices=[('Available', 'Available'), ('Not Available', 'Not Available')], default='Available', help_text='Book availability', max_length=100, verbose_name='Book availability'),
        ),
    ]
