from pickle import TRUE
from django.http import HttpResponse
from django.shortcuts import render
import subprocess
from conversion.forms import UserImage
from conversion.models import UploadImage  


# Create your views here.
def index(req):
    # print("-------------------------Handwriting-Text-------------------------")
    # p = subprocess.Popen(["../Handwriting-Text-Conversion/env/bin/python", "../Handwriting-Text-Conversion/src/main.py", '--mode','infer','--img', '../Handwriting-Text-Conversion/data/kunal_san.png'], stdout=subprocess.PIPE)
    # out, err = p.communicate()
    # print(type(out))
    # output = str(out).split("Recognized:")
    # print("output from sub:",output[1][2:-4])
    # return HttpResponse(output[1][2:-4]+str(out_th)[2:-3])
    if req.method =='POST':
        print(req.POST.get("text"))
        # f = req.FILES['sentFile'] # here you get the files needed
        # print(f.name)
        print("------------------------Text-Handwriting-------------------------")
        print(str(req.POST.get("text")))
        p_th = subprocess.Popen(["./Text-Handwriting-Conversion/env/bin/python", "./Text-Handwriting-Conversion/demo.py", "--text",str(req.POST.get("text"))], stdout=subprocess.PIPE)
        out_th, err_th = p_th.communicate()
        print("output-err:", err_th)
        print("output-out:", out_th)
        image = TRUE

        form = UserImage()
        # form = UserImage(req.POST, req.FILES)
        # if form.is_valid():
        #     form.save()
        #     filename = str(req.FILES['image'])
        #     print("filename:", filename)

        return render(req, 'conversion/index.html',{'form' : form, 'image': image})
    else:
        form = UserImage()
    return render(req, 'conversion/index.html',{'form' : form})
    # return HttpResponse("Done")


def change(req):
    # return HttpResponse(output[1][2:-4]+str(out_th)[2:-3])
    if req.method =='POST':
        form = UserImage(req.POST, req.FILES)
        if form.is_valid():
            form.save()
            filename = "./media/images/"
            filename = filename + str(req.FILES['image'])
        print("-------------------------Handwriting-Text-------------------------")
        p = subprocess.Popen(["./Handwriting-Text-Conversion/env/bin/python", "./Handwriting-Text-Conversion/src/main.py", '--mode','infer','--img', filename], stdout=subprocess.PIPE)
        out, err = p.communicate()
        output = str(out).split("Recognized:")
        print("output from sub:",output[1][2:-4])
        result = output[1][2:-4]
        return render(req, 'conversion/index.html',{'form' : form, 'res': result})
    else:
        form = UserImage()
    return render(req, 'conversion/index.html',{'form' : form})

def convert(req):
    # return HttpResponse(output[1][2:-4]+str(out_th)[2:-3])
    if req.method =='POST':
        form = UserImage(req.POST, req.FILES)
        if form.is_valid():
            form.save()
            filename = "./media/images/"
            filename = filename + str(req.FILES['image'])
        print("-------------------------Handwriting-Text-------------------------")
        p = subprocess.Popen(["./Handwriting-Text-Conversion/env/bin/python", "./Handwriting-Text-Conversion/src/main.py", '--mode','infer','--img', filename], stdout=subprocess.PIPE)
        out, err = p.communicate()
        
        output = str(out).split("Recognized:")
        print("output from sub:",output[1][2:-4])
        result = output[1][2:-4]
        print("------------------------Text-Handwriting-------------------------")
        p_th = subprocess.Popen(["./Text-Handwriting-Conversion/env/bin/python", "./Text-Handwriting-Conversion/demo.py", "--text",result], stdout=subprocess.PIPE)
        out_th, err_th = p_th.communicate()
        print("output-err:", err_th)
        print("output-out:", out_th)
        image = TRUE
        return render(req, 'conversion/index.html',{'form' : form, 'image': image})
    else:
        form = UserImage()
    return render(req, 'conversion/index.html',{'form' : form})