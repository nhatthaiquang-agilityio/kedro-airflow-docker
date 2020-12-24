#!/usr/bin/env bash
cd example &&
    kedro install &&
    pip install kedro-airflow==0.3.0 &&
    kedro airflow create &&
    kedro airflow deploy &&
    airflow webserver