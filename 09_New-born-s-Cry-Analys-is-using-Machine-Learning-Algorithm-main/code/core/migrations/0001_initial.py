# Generated by Django 3.1.2 on 2022-02-27 18:39

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Audio_store',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('record', models.FileField(upload_to='documents/')),
            ],
            options={
                'db_table': 'Audio_store',
            },
        ),
    ]