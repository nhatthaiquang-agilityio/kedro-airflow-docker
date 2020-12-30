FROM puckel/docker-airflow:1.10.9

COPY requirements.txt /usr/local/airflow

COPY example/src/requirements.txt /usr/local/airflow/kedro-requirements.txt

WORKDIR /usr/local/airflow

USER root
RUN apt-get update && apt-get install build-essential

RUN pip install -r requirements.txt
RUN pip install -r kedro-requirements.txt

RUN mkdir /usr/local/airflow/dags

RUN mkdir -p /usr/local/airflow/example
ENV AIRFLOW__CORE__FERNET_KEY=VYZffmGueZ9NZk-YCFKnVt5xYTKzXnuMvZQn9ave6GY=

RUN airflow initdb

WORKDIR /usr/local/airflow/example