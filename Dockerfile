# Use the official Python image.
FROM python:3.7

COPY . .

RUN pip install gunicorn
RUN pip install flask-wtf
RUN pip install flask-bootstrap
RUN pip install Flask-Cors
RUN pip install google-cloud-firestore
RUN pip install google-cloud-logging

CMD gunicorn --bind 0.0.0.0:$PORT --workers 1 --threads 8 app:app