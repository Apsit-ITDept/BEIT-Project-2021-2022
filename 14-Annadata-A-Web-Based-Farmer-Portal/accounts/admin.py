import imp
from django.contrib import admin

# Register your models here.
from .models import LoanSchemeForFarmers
from .models import CropInfo
from .models import extendeduser
# from .models import MarketPrices
from .models import WillPlant
from .models import CityData
from .models import  FbModel
from .models import  EquipmentShop
from .models import  AdminTip
admin.site.register(LoanSchemeForFarmers)
admin.site.register(CropInfo)
admin.site.register(extendeduser)
# admin.site.register(MarketPrices)
admin.site.register(WillPlant)
admin.site.register(CityData)
admin.site.register(EquipmentShop)
admin.site.register(AdminTip)

class FbAdmin(admin.ModelAdmin):
	list_display = ('fname','cr_dt')
	list_filter = ('cr_dt',)
admin.site.register(FbModel,FbAdmin)