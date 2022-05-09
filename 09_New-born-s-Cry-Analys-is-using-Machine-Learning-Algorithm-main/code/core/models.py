from django.db import models

# Create your models here.
class Audio_store(models.Model):
    record=models.FileField(upload_to='documents/')
    class Meta:
        db_table='Audio_store'
