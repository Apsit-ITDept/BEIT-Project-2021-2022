from email.mime import audio
from operator import truediv
from django.shortcuts import render
from core.forms import AudioForm
from django.http import HttpResponse
from core.demo import something
import cry_analysis.predict as model
# Create your views here.
def index(request):
      sol={"angry": " Check for Fever, Play lullaby.", "hungry":"Breast Feeding","discomfort":"Check for Fever, Give them Colic medicine. ","tired":"Baby needs sleep, Check for Fever","belly_pain":"Hold them on one shoulder and rub their back."}
      result=False
      if request.method == 'POST':
            form = AudioForm(request.POST,request.FILES or None) 
            if form.is_valid():
                  form.save()
                  result=True 
                  filename = str(request.FILES['record'])
                  print("filename:", filename)
                  output=model.main(filename)
                  solution=sol[output]

                  return render(request, 'index.html', {'form' : form, 'result': result, 'output': output,"sol":solution})
      else:
            form = AudioForm() 
      return render(request, 'index.html', {'form' : form, 'result': result}) 


def about(request):
      return render(request, 'about.html') 


def support(request):
      return render(request, 'support.html') 


     