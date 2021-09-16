#!/bin/bash

gcloud config list account --format "value(core.account)"

exec gunicorn --bind :$PORT --workers 1 --threads 8 app:app