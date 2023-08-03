FROM python:3.10.12-slim-bullseye

WORKDIR /tmp

RUN apt update && apt install -y libmemcached-dev zlib1g-dev gcc

WORKDIR /tmp/django/tests

RUN pip install --upgrade pip
RUN python -m pip install -e ..
RUN python -m pip install -r requirements/py3.txt
