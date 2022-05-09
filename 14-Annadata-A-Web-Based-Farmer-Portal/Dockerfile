FROM ubuntu:18.04
WORKDIR /userapp
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1
COPY ./req.txt ./req.txt
#RUN python -m pip install --upgrade pip
#RUN python -m pip install -r 'requirements.txt'
COPY . .
# CMD ["ping","google.com"]
RUN apt-get update
RUN apt-get install python3 -y
RUN apt install python3-pip -y
RUN pip3 install -r req.txt
# CMD ["python3","manage.py","runserver"]
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "DebugEntity.wsgi"]
