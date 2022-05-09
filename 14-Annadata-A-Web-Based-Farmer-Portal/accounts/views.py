# from unicodedata import category
from dis import dis
from math import dist
from random import randrange
from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib import auth
from django.contrib.auth.models import User
from matplotlib import use
from .models import CropInfo
from .models import extendeduser
from .models import CityData
from .models import FbModel
from .models import LoanSchemeForFarmers
from .models import AdminTip
from .models import EquipmentShop
import json
from .models import predictCropsModel
from .models import WillPlant
from django.contrib.auth.decorators import login_required
user_data=extendeduser.objects.values('phone','town','user')
predictCropModelInstance = predictCropsModel()
import requests
import threading

#User authentication related
def handlelogin(request):
    if request.method == "POST":
        username = request.POST['uname1']
        password = request.POST['pass3']
        user = auth.authenticate(username=username, password=password)
        if user is not None:
            auth.login(request, user)
            userData = extendeduser.objects.filter(user=request.user)
            messages.success(request, "Successfully logged in")
            if request.user.is_superuser:
                return redirect("admin")
            userCategory = str(userData[0].cat)
            if userCategory == "Farmer":
                    return redirect('farmer')
        else:
            messages.error(request, "Invalid Credentials")
            return render(request, 'accounts/basic.html')
    else:
        return HttpResponse('NOT allowed')


def handlelogout(request):
    logout(request)
    messages.success(request, "Successfully logged out")
    return render(request, 'accounts/basic.html')


#User related
def userinfo(request):
    userdata=[]
    urs=extendeduser.objects.values('phone','cat','town','user')
    u=User.objects.values('id','username','email')
    for i in urs:
        i["username"]=User.objects.get(id=i["user"])
        userdata.append(i)
    userdata={'userdata':userdata}
    return render(request,'accounts/userinfo.html',userdata)

def cropcountadminview(request):
        will_plant = WillPlant.objects.values('user', 'crop', 'town', 'phone')
        lis=[]
        for i in will_plant:
            lis.append(i)
            
        croplist=[]
        for i in lis:
            croplist.append(i['crop'])
        croplist = list(set(croplist))
        citylist=[]
        for i in lis:
            croplist.append(i['crop'])
        citylist = list(set(citylist))
        lis=sorted(lis, key=lambda i: i['town'])
        dic={'dic':lis}
        return render(request,'accounts/cropcountadminview.html',dic)


#User pages
def index(request):
    return render(request, 'accounts/basic.html')

def Farmer(request):
    if validateUser(request.user):
        return render(request, 'accounts/FarmerPage.html')
    return redirect("home")

def home(request):
    return render(request, 'accounts/basic.html')

def Admin(request):
    if validateAdmin(request.user):
        return render(request, 'accounts/AdminPage.html')
    return redirect("home")

def validateUser(userReceived):
    if userReceived.is_authenticated:
        try:
            obj=extendeduser.objects.get(user=userReceived)
            category=obj.cat
            if category=="Farmer":
                return True
        except extendeduser.DoesNotExist:
            pass
    return False


def validateAdmin(user):
    if user.is_superuser:
        return True
    return False

#View crop details
def viewcrop(request):
    if request.method=='POST':
        if validateUser(request.user):
            val=request.POST.get('crop-name')
            return render(request,'accounts/crops/'+val+'.html')
        else:
            return HttpResponse('LOGIN FIRST')
    else:
        return HttpResponse('NO CROP SELECTED')

def signup(request):
    try:
        if request.method == 'POST':
            uname = request.POST['uname']
            email = request.POST['email']
            fname = request.POST['fname']
            lname = request.POST['lname']
            phone = request.POST['phone']
            cat = 'Farmer'
            town=request.POST['town']
            pass1 = request.POST['pass1']
            pass2 = request.POST['pass2']
            if pass1!=pass2:
                messages.error(request, "Passwords not Same")
                return render(request, 'accounts/basic.html')
            if len(pass1)<6:
                messages.error(request, "Password must be greater than 6 characters")
                return render(request, 'accounts/basic.html')
            user = User.objects.create_user(uname, email, pass1)
            user.first_name = fname
            user.last_name = lname
            user.save()
            newuser = extendeduser(phone=phone, cat=cat,town=town, user=user)
            newuser.save()
            euser= extendeduser.objects.values('phone','user')
            url = "https://www.fast2sms.com/dev/bulkV2"
            querystring = {
                "authorization": "m1RK6frquN3b9XpPM80awTvFHoYLWVhxCtl5ZJ7kigSyEOe2scbaP8mEJwrj09De2Op3ZsQGNfkyoiFt",
                "sender_id": "Annadata",
                "message": "Your Annadata account has been created successfully\n Your Username is " + uname + "\nPassword is  " + pass1 + "\n If you have any query call on below Number \nCustomerCare No:12131456891",
                "language": "english", "route": "p", "numbers": phone}
            headers = {
                'cache-control': "no-cache"
            }
            response = requests.request("GET", url, headers=headers, params=querystring)
            print(response.text)
            messages.success(request, "Your Annadata Account has been Created Successfully")
            return render(request, 'accounts/basic.html')
    except:
        messages.error(request, "User with this information already exists")
        return render(request, 'accounts/basic.html')


def adminpanel(request):
    if request.method == 'POST':
        info = str(request.POST['dos'])
        name = str(request.POST['tos'])
        l = LoanSchemeForFarmers()
        l.info = info
        l.scheme_name = name
        l.save()
        euser=extendeduser.objects.values('phone','user')
        q=[]
        for j in euser:
            q.append(j['phone'])

            url = "https://www.fast2sms.com/dev/bulkV2"
            querystring = {"authorization": "m1RK6frquN3b9XpPM80awTvFHoYLWVhxCtl5ZJ7kigSyEOe2scbaP8mEJwrj09De2Op3ZsQGNfkyoiFt", "sender_id": "ANNADATA", "message": "Name " +l.scheme_name + "Information: " + l.info+"Scheme updated on Annadata Portal",
                            "language": "english", "route": "p", "numbers":q}
            headers = {
                 'cache-control': "no-cache"
            }
            response = requests.request("GET", url, headers=headers, params=querystring)
            print(response.text)

            #zerosms.sms(phno=9689914109, passwd=password, message='helloworld!!', receivernum=receiver mobilenumber)
            # #SMS Notification
            #     if p=='8830502656':
            #         account_sid = 'ACa522720e1d991ba02ac1afec621f3ed4'
            #         auth_token = 'f284dae9dfc1886dfe099fb75b0908a7'
            #         client = Client(account_sid, auth_token)
            #
            #         message = client.messages.create(
            #             body=l.scheme_name+"     Scheme Info:      "+l.info,
            #             from_='+12183166674',
            #             to='+918830502656'
            #         )
            #
            #         print(message.sid)

    return render(request, 'accounts/AdminPanel.html')
#Crop prediction
def getPrediction(district,cropSeasonInt):
    global predictCropModelInstance
    cityDataReceived=CityData.objects.get(city=district)
    cityPh=cityDataReceived.ph
    cityTempreture=cityDataReceived.avg_temp
    cityRain=cityDataReceived.avg_rain
    if cropSeasonInt == 1:
        cityTempreture=cityDataReceived.kharif_temp
        cityRain=cityDataReceived.kharif_rain
    elif cropSeasonInt == 2:
        cityTempreture=cityDataReceived.rabbi_temp
        cityRain=cityDataReceived.rabbi_rain
    else:
        cityTempreture=cityDataReceived.avg_temp
        cityRain=cityDataReceived.avg_rain
    return predictCropModelInstance.predict(district, cropSeasonInt, cityRain, cityTempreture, cityPh) 

def predictCrops(request):
    if validateUser(request.user):
        if request.method=='GET':
            context={'getMethodBoolean':1}

        if request.method == 'POST':
            district=request.POST.get('District4').upper()
            cropSeasonInt = int(request.POST.get('SeasonInput'))
            predictedCrops = getPrediction(district, cropSeasonInt)
            crops = CropInfo.objects.values('crop_name', 'crop_info', 'img')
            cropFoundList = []
            plantedCropsList = []
            willPlantDbValues = WillPlant.objects.values('user','crop','town','phone')
            
            for i in willPlantDbValues:
                if i['town'] == district:
                    plantedCropsList.append(i['crop'])
            
            for i in range(0,len(predictedCrops)):
                for j in crops:
                    if j['crop_name'] == predictedCrops[i][0]:
                        j['crop_production'] = round(predictedCrops[i][1][0],4)
                        countOfPredictedCropInDb = plantedCropsList.count(predictedCrops[i][0])
                        j['count'] = countOfPredictedCropInDb
                        if countOfPredictedCropInDb > 1:
                            j['danger'] = 1
                        else:
                            j['safe'] = 1
                        cropFoundList.append(j)

            cropSeasonValue = ''
            if cropSeasonInt == 1:
                cropSeasonValue = 'Kharif'
            elif cropSeasonInt == 2:
                cropSeasonValue = 'Rabbi'
            elif cropSeasonInt == 3:
                cropSeasonValue = 'No specific season'
            elif cropSeasonInt == 4:
                cropSeasonValue='All Seasons Without Previous Year Production'
            
            context = {'crop': predictedCrops,'district':district,'season':cropSeasonValue,'predicted_crops':predictedCrops,'found':cropFoundList}
        return render(request, 'accounts/predict.html', context)
            
    return redirect("home")

#Will plant section
def willplant(request):
    if request.method=='POST' and validateUser(request.user):
        flg=0
        crop=request.POST.get('crop-name')
        dis=request.POST.get('district')
        obj=extendeduser.objects.get(user=request.user)
    will_plant=WillPlant.objects.values('user','crop','town','phone')

    for i in will_plant:
        if str(i['user'])==str(request.user) and str(i['crop']) == str(crop) and str(i['town']) == str(dis) and str(i['phone'] == obj.phone):
            flg=1
    if flg==0 or len(will_plant)==0:
        w = WillPlant()
        w.user = str(request.user)
        w.town = str(dis)
        w.crop = str(crop)
        w.phone = str(obj.phone)
        w.save()
    return render(request,'accounts/FarmerPage.html')


def weather(request):
    try:
        if request.method == 'POST':
            city = request.POST['city']
            if len(city) == 0:
                messages.error(request, "Enter city name")
                return render(request, 'accounts/weather.html')
            src = 'http://api.openweathermap.org/data/2.5/weather?appid=e995a3bb90b825a2202b9786e17caa56&q='
            url = src + city
            list_of_data = requests.get(url).json()
            temp = list_of_data['main']['temp']
            newtmp = round(temp - 273.15, 3)
            condition = list_of_data['weather'][0]['description']
            humidity = list_of_data['main']['humidity']
            data = {
                "city": city,
                "temp": newtmp,
                "humidity": humidity,
                "condition": condition,
                "icon": str(list_of_data['weather'][0]['icon']),
            }
        return render(request, 'accounts/weather.html', data)
    except:
        messages.error(request, "Write city name correctly")
        return render(request, 'accounts/weather.html')

def Addschemes(request):
    return render(request, 'accounts/AddSchemes.html')


def admintips(request):
    if request.method == "POST":
        tipname = str(request.POST['name'])
        tipinfo = str(request.POST['info'])
        cropimg = str(request.POST['img'])
        e = AdminTip()
        e.tip_name = tipname
        e.tip_info = tipinfo
        e.tip_img = '/static/accounts/images/' + cropimg
        e.save()
    return render(request, 'accounts/admintips.html')


def farmertip(request):
    l = AdminTip.objects.values('tip_name', 'tip_info')
    lis = []
    for i in l:
        lis.append(i)
    dic = {'dic': lis}

    return render(request, 'accounts/farmertip.html', dic)


def AddShop(request):
    if request.method == 'POST':
        district = str(request.POST['equi'])
        e = EquipmentShop()
        e.district_name = district
        e.save()

    return render(request, 'accounts/AddShop.html')


def govtschemes(request):
    l = LoanSchemeForFarmers.objects.values('scheme_name', 'info')
    lis = []
    for i in l:
        lis.append(i)
    dic = {'dic': lis}

    return render(request, 'accounts/govschemes.html', dic)


def Equipment(request):
    e = EquipmentShop.objects.values('district_name')
    lis = []
    for i in e:
        lis.append(i)
    dic = {'dic': lis}
    return render(request, 'accounts/Equipment.html', dic)


def showweather(request):
    return render(request, 'accounts/weather.html')


def schemepmkisan(request):
    if request.method == 'POST':
        name = request.POST.get('schemename')
        print(name)
    return render(request, 'accounts/' + name + '.html')


def shops(request):
    if request.method == 'POST':
        district = request.POST.get('districtname')
        print(district)
    return render(request, 'accounts/' + district + '.html')


def feedback(request):
    if request.method == "POST":
        na = request.POST.get("fname")
        fd = request.POST.get("feedback")
        ph = request.POST.get("phone")
        data = FbModel(fname=na, feedback=fd, phone=ph)

        data.save()

        return render(request, "accounts/feedback.html", {"msg": "Thanks for the Feedback"})


    else:

        return render(request, "accounts/feedback.html")


user_data = extendeduser.objects.values('phone', 'town', 'user')


def printit():
    threading.Timer(10, printit).start()
    for i in user_data:
        city = i['town']
        src = 'http://api.openweathermap.org/data/2.5/weather?appid=e995a3bb90b825a2202b9786e17caa56&q='
        url = src + city
        list_of_data = requests.get(url).json()
        temp = list_of_data['main']['temp']
        newtmp = round(temp - 273.15, 3)
        condition = list_of_data['weather'][0]['description']
        humidity = list_of_data['main']['humidity']
        data = {
            "city": city,
            "temp": newtmp,
            "humidity": humidity,
            "condition": condition,
            "icon": str(list_of_data['weather'][0]['icon']),
        }
        print(data)
        if data['condition'] == "smoke":
            euser = extendeduser.objects.values('phone', 'user')
            q = []
            for j in euser:
                q.append(j['phone'])

                url = "https://www.fast2sms.com/dev/bulk"
                querystring = {
                    "authorization": "m1RK6frquN3b9XpPM80awTvFHoYLWVhxCtl5ZJ7kigSyEOe2scbaP8mEJwrj09De2Op3ZsQGNfkyoiFt",
                    "sender_id": "ANNADATA",
                    "message": "Hey Farmer your " + city + " City has seen " + condition + " weather conditions, Please be aware, Customer Care Number: 252455544",
                    "language": "english", "route": "p", "numbers": q}
                headers = {
                    'cache-control': "no-cache"
                }
                response = requests.request("GET", url, headers=headers, params=querystring)
                print(response.text)

                print('\n' + city, ' user ' + str(i['user']) + ' overcast condition', end='\n')
        elif data["condition"] == "haze":
            euser = extendeduser.objects.values('phone', 'user')
            q = []
            for j in euser:
                q.append(j['phone'])

                url = "https://www.fast2sms.com/dev/bulk"
                querystring = {
                    "authorization": "SqbjiJDXHkYR2An46KOl8ZGexFmdsvWVc0fa3h1PgCIou9NMUTK5XiNwGH7jDVrmP6haAxpSZItyl0f3",
                    "sender_id": "ANNADATA",
                    "message": "Hey Farmer your " + city + " City has seen " + condition + " weather conditions, Please be aware, Customer Care Number: 252455544",
                    "language": "english", "route": "p", "numbers": q}
                headers = {
                    'cache-control': "no-cache"
                }
                response = requests.request("GET", url, headers=headers, params=querystring)
                print(response.text)


# printit()


def soil(request):
    return render(request, 'accounts/soils.html')


def SoilLabs(request):
    return render(request, 'accounts/SoilLabs.html')


def WaterSheld(request):
    return render(request, 'accounts/WaterSheld.html')


def WaterSheldProgramm(request):
    return render(request, 'accounts/WaterSheldProgramm.html')


def Soilandaquaculturefieldtreatment(request):
    return render(request, 'accounts/Soilandaquaculturefieldtreatment.html')


def Soilandwaterconservationdraintreatment(request):
    return render(request, 'accounts/Soilandwaterconservationdraintreatment.html')


def pesticides(request):
    return render(request, 'accounts/pesticides.html')


def courses(request):
    return render(request, 'accounts/courses.html')



def user_resetpassword(request):
	if request.method == "POST":
		un = request.POST.get("un")
		ph = request.POST.get("ph")
		try:
			usr = User.objects.get(username=un) and extendeduser.objects.get(phone=ph)
			print(usr)
			text = "123456789"
			pass3 = ""
			for i in range(6):
				pw = pass3 + text[randrange(len(text))]
			send_sms(ph,pw)
			usr = User.objects.get(username=un)
			usr.set_password(pw)
			usr.save()
			return redirect("home")
		except User.DoesNotExist:
			return render(request,"accounts/user_resetpassword.html",{"msg":"Invalid Details"})
	else:
		return render(request,"accounts/user_resetpassword.html")
					
def send_sms(ph,pw):
	
	url = "https://www.fast2sms.com/dev/bulk"
	querystring = {
	"authorization":"m1RK6frquN3b9XpPM80awTvFHoYLWVhxCtl5ZJ7kigSyEOe2scbaP8mEJwrj09De2Op3ZsQGNfkyoiFt",
		"sender_id":"ANNADATA",
		"message":   "Farmer your Password is  "+ pw,
		"language":"english ",
		"route":"p",
		"numbers":str(ph)
	}
	
	res = requests.request("GET",url,params=querystring)
	print(res.text)


