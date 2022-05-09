from statistics import mode
from django.db import models
from django.contrib.auth.models import User
import pandas as pd
from datetime import datetime
from pyrsistent import m
from sklearn.metrics import accuracy_score
import joblib


class LoanSchemeForFarmers(models.Model):
	loan_id=models.AutoField
	info=models.TextField()
	scheme_name=models.CharField(max_length=200)
	def __str__(self):
		return self.scheme_name

class AdminTip(models.Model):
	tip_name = models.TextField()
	tip_info=models.TextField()
	tip_img=models.ImageField(upload_to="static/accounts/images")
	def __str__(self):
		return self.tip_name


class EquipmentShop(models.Model):
	shop_id = models.AutoField
	district_name = models.CharField(max_length=200)
	def __str__(self):
		return self.district_name


class FbModel(models.Model):
    fname = models.CharField(max_length=30)
    feedback = models.TextField()
    phone = models.EmailField()
    cr_dt = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.fname


class CropInfo(models.Model):
    crop_id=models.AutoField
    crop_name=models.CharField(max_length=200)
    crop_info=models.TextField()
    img=models.ImageField(upload_to="accounts/images")
    def __str__(self):
        return self.crop_name


class extendeduser(models.Model):
    phone=models.CharField(max_length=12)
    cat=models.CharField(max_length=10)
    town=models.CharField(max_length=50)
    user=models.OneToOneField(User,on_delete=models.CASCADE)

class WillPlant(models.Model):
    user=models.CharField(max_length=20)
    crop=models.CharField(max_length=20)
    town=models.CharField(max_length=20)
    phone=models.CharField(max_length=12,default=None)
    def __str__(self):
        return self.town

class CityData(models.Model):
    id=models.AutoField
    city=models.CharField(max_length=50)
    kharif_rain=models.FloatField(default=None, blank=True, null=True)
    rabbi_rain=models.FloatField(default=None, blank=True, null=True)
    avg_rain=models.FloatField(default=None, blank=True, null=True)
    kharif_temp=models.FloatField(default=None, blank=True, null=True)
    rabbi_temp=models.FloatField(default=None, blank=True, null=True)
    avg_temp=models.FloatField(default=None, blank=True, null=True)
    ph=models.FloatField(default=None, blank=True, null=True)
    def __str__(self):
        return self.city

def getIndexes(dfObj, value):
    ''' Get index positions of value in dataframes.'''
    listOfPos = list()
    result = dfObj.isin([value])
    seriesObj = result.any()
    columnNames = list(seriesObj[seriesObj == True].index)
    for col in columnNames:
        rows = list(result[col][result[col] == True].index)
        for row in rows:
            listOfPos.append((row, col))
    return listOfPos


class predictCropsModel:
    def __init__(self):
        self.dictionaryOfCrops = {'Bajra': 0.0, 'Banana': 0.0, 'Barley': 0.0, 'Bean': 0.0, 'Black pepper': 0.0, 'Blackgram': 0.0,
               'Bottle Gourd': 0.0, 'Brinjal': 0.0,
               'Cabbage': 0.0, 'Cardamom': 0.0, 'Carrot': 0.0, 'Castor seed': 0.0, 'Cauliflower': 0.0, 'Chillies': 0.0,
               'Colocosia': 0.0, 'Coriander': 0.0,
               'Cotton': 0.0, 'Cowpea': 0.0, 'Drum Stick': 0.0, 'Garlic': 0.0, 'Ginger': 0.0, 'Gram': 0.0,
               'Grapes': 0.0, 'Groundnut': 0.0, 'Gaur seed': 0.0, 'Horse-gram': 0.0,
               'Jowar': 0.0, 'Jute': 0.0, 'Khesari': 0.0, 'Lady Finger': 0.0, 'Lentil': 0.0, 'Linseed': 0.0,
               'Maize': 0.0, 'Mesta': 0.0, 'Moong': 0.0, 'Moth': 0.0, 'Onion': 0.0,
               'Orange': 0.0, 'Papaya': 0.0, 'Peas': 0.0, 'Pineapple': 0.0, 'Potato': 0.0, 'Raddish': 0.0, 'Ragi': 0.0,
               'Rice': 0.0, 'Safflower': 0.0, 'Sannhamp': 0.0, 'Sesamum': 0.0,
               'Soyabean': 0.0, 'Sugarcane': 0.0, 'Sunflower': 0.0, 'Sweet potato': 0.0, 'Tapioca': 0.0, 'Tomato': 0.0,
               'Turmeric': 0.0, 'Urad': 0.0, 'Varagu': 0.0, 'Wheat': 0.0
               }
        self.listOfDictionaryOfCrops = list(self.dictionaryOfCrops)
        self.previousYearData = pd.read_csv('./model/previous-year-prod-2.csv')
        self.randomForestModel = joblib.load('./model/ramdomF_model')
        

    def predict(self,district,season,cityRain,cityTempreture,cityPh):
        rain = cityRain
        temp = cityTempreture
        ph = cityPh
        cropPredictionExcludingPreviousYear = {}
        cropPredictionIncludingPreviousYear = {}
        
        #lock with district for previous year prouction
        val = self.previousYearData.loc[self.previousYearData['District_Name'] == district]
        
        #check for all crops prediction, by list of 0 and 1
        for i in range(0, 58):
            self.dictionaryOfCrops[self.listOfDictionaryOfCrops[i]] = 1.0
            independentVariables = [[self.dictionaryOfCrops['Bajra'], self.dictionaryOfCrops['Banana'], self.dictionaryOfCrops['Barley'], self.dictionaryOfCrops['Bean'], self.dictionaryOfCrops['Black pepper'], self.dictionaryOfCrops['Blackgram'],
                       self.dictionaryOfCrops['Bottle Gourd'], self.dictionaryOfCrops['Brinjal'], self.dictionaryOfCrops['Cabbage'], self.dictionaryOfCrops['Cardamom'], self.dictionaryOfCrops['Carrot'],
                       self.dictionaryOfCrops['Castor seed'], self.dictionaryOfCrops['Cauliflower'], self.dictionaryOfCrops['Chillies'], self.dictionaryOfCrops['Colocosia'], self.dictionaryOfCrops['Coriander'],
                       self.dictionaryOfCrops['Cotton'], self.dictionaryOfCrops['Cowpea'], self.dictionaryOfCrops['Drum Stick'], self.dictionaryOfCrops['Garlic'], self.dictionaryOfCrops['Ginger'], self.dictionaryOfCrops['Gram'],
                       self.dictionaryOfCrops['Grapes'], self.dictionaryOfCrops['Groundnut'],
                       self.dictionaryOfCrops['Gaur seed'], self.dictionaryOfCrops['Horse-gram'], self.dictionaryOfCrops['Jowar'], self.dictionaryOfCrops['Jute'], self.dictionaryOfCrops['Khesari'],
                       self.dictionaryOfCrops['Lady Finger'], self.dictionaryOfCrops['Lentil'], self.dictionaryOfCrops['Linseed'], self.dictionaryOfCrops['Maize'], self.dictionaryOfCrops['Mesta'], self.dictionaryOfCrops['Moong'],
                       self.dictionaryOfCrops['Moth'], self.dictionaryOfCrops['Onion'], self.dictionaryOfCrops['Orange'], self.dictionaryOfCrops['Papaya'], self.dictionaryOfCrops['Peas'], self.dictionaryOfCrops['Pineapple'],
                       self.dictionaryOfCrops['Potato'], self.dictionaryOfCrops['Raddish'], self.dictionaryOfCrops['Ragi'], self.dictionaryOfCrops['Rice'], self.dictionaryOfCrops['Safflower'], self.dictionaryOfCrops['Sannhamp'],
                       self.dictionaryOfCrops['Sesamum'], self.dictionaryOfCrops['Soyabean'], self.dictionaryOfCrops['Sugarcane'],
                       self.dictionaryOfCrops['Sunflower'], self.dictionaryOfCrops['Sweet potato'], self.dictionaryOfCrops['Tapioca'], self.dictionaryOfCrops['Tomato'], self.dictionaryOfCrops['Turmeric'],
                       self.dictionaryOfCrops['Urad'], self.dictionaryOfCrops['Varagu'], self.dictionaryOfCrops['Wheat'],
                       float(rain), temp, ph]]
            
            #get prediction for particular crop
            predictedProductionForCrops = self.randomForestModel.predict(independentVariables)
            
            #reset crop index value to 0
            self.dictionaryOfCrops[self.listOfDictionaryOfCrops[i]] = 0.0
            
            if season == 4:
                cropPredictionExcludingPreviousYear[self.listOfDictionaryOfCrops[i]] = predictedProductionForCrops
            else:
                #check if crop present in previous year production
                found = val.loc[val['Crop'].str.contains(str(self.listOfDictionaryOfCrops[i]))]

                if found.count()[0] != 0:
                    #set frame to kharif season
                    if season == 1:
                        val = val.loc[val['Season'] == 'Kharif']
                    #set frame to rabbi season
                    elif season == 2:
                        val = val.loc[val['Season'] == 'Rabi']
                    
                    #lock for that crop
                    val = val.loc[val['Crop'] == str(self.listOfDictionaryOfCrops[i])]
                    
                    #get average production from previous year
                    mean_val = self.listOfDictionaryOfCrops[i], val['per production'].mean()
                    uniqueCropsList = list(val.Crop.unique())
                    
                    if self.listOfDictionaryOfCrops[i] in uniqueCropsList:
                        #get average of predicted and previous year production
                        recommendationValue = (predictedProductionForCrops+mean_val[1])/2
                        cropPredictionIncludingPreviousYear[self.listOfDictionaryOfCrops[i]] = recommendationValue
                    
                    #revert changes
                    val = self.previousYearData.loc[self.previousYearData['District_Name'] == district]
                    self.dictionaryOfCrops[self.listOfDictionaryOfCrops[i]] = 0.0
            
        #sort list in reverse order
        if season==4:
            reverseSortedPredictedCropDict = sorted(cropPredictionExcludingPreviousYear.items(), key=lambda x: x[1], reverse=True)
        else:
            reverseSortedPredictedCropDict = sorted(cropPredictionIncludingPreviousYear.items(), key=lambda x: x[1], reverse=True)
        
        return reverseSortedPredictedCropDict