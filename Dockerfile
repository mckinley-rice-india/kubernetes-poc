FROM ubuntu:18.04

RUN mkdir -p /app 
WORKDIR /app

COPY ./requirements.txt /app/requirements.txt
RUN apt-get update
RUN apt-get install -y \
    python3.8 \
    python3-pip
RUN pip3 install -r requirements.txt

COPY ./src/ /app/
ENV FLASK_APP=server.py
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

CMD flask run -h 0.0.0.0 -p 5000