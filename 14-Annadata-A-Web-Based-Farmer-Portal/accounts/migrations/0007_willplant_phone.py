# Generated by Django 3.0.8 on 2022-02-16 01:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0006_auto_20220213_0204'),
    ]

    operations = [
        migrations.AddField(
            model_name='willplant',
            name='phone',
            field=models.CharField(default=None, max_length=12),
        ),
    ]