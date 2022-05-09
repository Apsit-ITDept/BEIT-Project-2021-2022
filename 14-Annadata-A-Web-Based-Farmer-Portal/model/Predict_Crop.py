#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Aug  1 13:22:04 2020

@author: cur53
"""
import pandas as pd
import operator
from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import LabelEncoder,OneHotEncoder
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from datetime import datetime
from sklearn.metrics import accuracy_score
from sklearn.ensemble import RandomForestRegressor
# import matplotlib.pyplot as mat

today = datetime.today()
datem = datetime.now().month



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

crop_pred_dataset = pd.read_csv('E:\\tmd_farmersfriend_v1\\tmd_farmersfriend_v1\\Farmers-Friend\model\\crop-prod-dataset.csv')
# annual_rainfall = pd.read_csv('annual-rainfall.csv')
# annual_rainfall = annual_rainfall[['DISTRICT','ANNUAL']]
# temp_ph = pd.read_csv('temp-ph-citywise.csv')
# previous_year = pd.read_csv('previous-year-prod.csv')

#Seprating dependant and independent variables
x = crop_pred_dataset.iloc[:, :-1].values
y = crop_pred_dataset.iloc[:, -1].values


#Converting catagorical values
ct = ColumnTransformer([('encoder', OneHotEncoder(), [3])], remainder = 'passthrough')
x = ct.fit_transform(x).toarray()

#Splitting training and testing dataset
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size = 0.2, random_state = 0)

#regression model
# regressor = LinearRegression()
# regressor.fit(x_train, y_train)
# print(regressor.score(x_test,y_test ))

randomregressor = RandomForestRegressor(n_estimators=10, random_state=0)
randomregressor.fit(x_train, y_train)
print(randomregressor.score(x_test,y_test)*100)


dic={'Bajra':0.0,'Banana':0.0,'Barley':0.0,'Bean':0.0,'Black pepper':0.0,'Blackgram':0.0,'Bottle Gourd':0.0,'Brinjal':0.0,
              'Cabbage':0.0,'Cardamom':0.0,'Carrot':0.0,'Castor seed':0.0,'Cauliflower':0.0,'Chillies':0.0,'Colocosia':0.0,'Coriander':0.0,
              'Cotton':0.0,'Cowpea':0.0,'Drum Stick':0.0,'Garlic':0.0,'Ginger':0.0,'Gram':0.0,'Grapes':0.0,'Groundnut':0.0,'Gaur seed':0.0,'Horse-gram':0.0,
              'Jowar':0.0,'Jute':0.0,'Khesari':0.0,'Lady Finger':0.0,'Lentil':0.0,'Linseed':0.0,'Maize':0.0,'Mesta':0.0,'Moong':0.0,'Moth':0.0,'Onion':0.0,
              'Orange':0.0,'Papaya':0.0,'Peas':0.0,'Pineapple':0.0,'Potato':0.0,'Raddish':0.0,'Ragi':0.0,'Rice':0.0,'Safflower':0.0,'Sannhamp':0.0,'Sesamum':0.0,
              'Soyabean':0.0,'Sugarcane':0.0,'Sunflower':0.0,'Sweet potato':0.0,'Tapioca':0.0,'Tomato':0.0,'Turmeric':0.0,'Urad':0.0,'Varagu':0.0,'Wheat':0.0
              }


lis=list(dic)
inp=input('Enter City Name:').upper()
# inp=inp.upper()
rain=float(input('Enter Rain:'))
temp=float(input('Enter Temp:'))
ph=float(input('Enter Ph:'))
# inp="PARBHANI"

# listOfPositions = getIndexes(annual_rainfall, inp)
# rain=annual_rainfall.loc[listOfPositions[0][0]][1]
# rain=200

# loc=getIndexes(temp_ph, inp)
# temp=temp_ph.iloc[loc[0][0]][1]
# ph=temp_ph.iloc[loc[0][0]][2]

# temp=30
# ph=4
print(rain,temp,ph)    
predicted_crop_list={}
for i in range(0,58):
    dic[lis[i]]=1.0
    #Checking crops from dict one by one
    z_test=[[dic['Bajra'], dic['Banana'], dic['Barley'], dic['Bean'], dic['Black pepper'], dic['Blackgram'], dic['Bottle Gourd'], dic['Brinjal'], dic['Cabbage'], dic['Cardamom'], dic['Carrot'], dic['Castor seed'], dic['Cauliflower'], dic['Chillies'], dic['Colocosia'], dic['Coriander'], dic['Cotton'], dic['Cowpea'], dic['Drum Stick'], dic['Garlic'], dic['Ginger'],dic['Gram'], dic['Grapes'], dic['Groundnut'],
                  dic['Gaur seed'], dic['Horse-gram'], dic['Jowar'],dic['Jute'], dic['Khesari'], dic['Lady Finger'], dic['Lentil'], dic['Linseed'], dic['Maize'], dic['Mesta'], dic['Moong'], dic['Moth'], dic['Onion'], dic['Orange'], dic['Papaya'], dic['Peas'], dic['Pineapple'], dic['Potato'], dic['Raddish'], dic['Ragi'], dic['Rice'], dic['Safflower'], dic['Sannhamp'], dic['Sesamum'], dic['Soyabean'], dic['Sugarcane'],
                  dic['Sunflower'], dic['Sweet potato'], dic['Tapioca'], dic['Tomato'], dic['Turmeric'], dic['Urad'], dic['Varagu'], dic['Wheat'],
                  float(rain),temp,ph]]
    #Prediction of value according to rainfall,temp,ph
    print(z_test)
    y_pred = list(randomregressor.predict(z_test))
    # y_pred = list(randomregressor.predict(z_test))
    dic[lis[i]]=0.0            
    predicted_crop_list[lis[i]]=y_pred
sorted_d = dict(sorted(predicted_crop_list.items(), key=operator.itemgetter(1),reverse=True))
for value in sorted_d.items():
    print(value)
