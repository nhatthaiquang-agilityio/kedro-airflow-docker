#!/usr/bin/env bash
cd example &&
    kedro install &&
    airflow webserver