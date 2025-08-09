FROM python:3.13.2-slim-bullseye

COPY . /var/www/django

WORKDIR /var/www/django/tests

RUN DEBIAN_FRONTEND=noninteractive apt update && DEBIAN_FRONTEND=noninteractive apt install -y libmemcached-dev zlib1g-dev gcc moreutils

RUN pip install --upgrade pip
RUN python -m pip install -e .. --root-user-action=ignore
RUN python -m pip install -r requirements/py3.txt
