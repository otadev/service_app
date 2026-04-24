FROM python:3.9-slim

COPY requirements.txt /temp/requirements.txt

RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*
RUN pip install -r /temp/requirements.txt
RUN adduser --disabled-password service-user

WORKDIR /service
COPY service /service
USER service-user
EXPOSE 8000
