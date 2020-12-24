FROM puckel/docker-airflow:1.10.9

COPY requirements.txt /usr/local/airflow
WORKDIR /usr/local/airflow

USER root
RUN apt-get update && apt-get install build-essential

RUN pip install -r requirements.txt

RUN mkdir -p /usr/local/airflow/dags

RUN mkdir -p /usr/local/airflow/example1
ENV AIRFLOW__CORE__FERNET_KEY=VYZffmGueZ9NZk-YCFKnVt5xYTKzXnuMvZQn9ave6GY=

RUN airflow initdb

WORKDIR /usr/local/airflow/example1