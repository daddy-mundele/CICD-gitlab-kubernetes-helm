FROM alpine:latest

ENV PYTHONUNBUFFERED=1

RUN mkdir /app

RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python

RUN python3 -m ensurepip

RUN pip3 install --no-cache --upgrade pip setuptools

WORKDIR /app/

ADD . /app/

RUN pip install -r requirements.txt

CMD ["python", "/app/app.py"]