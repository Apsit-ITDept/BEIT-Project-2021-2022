from django.db import models

# Create your models here.
class UploadImage(models.Model):
    image = models.ImageField(upload_to='images/')
    class Meta:
        db_table='image_store'