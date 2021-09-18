# Use the official Python image.
FROM python:3.7

COPY . .

RUN pip install flask gunicorn
RUN pip install flask-wtf
RUN pip install flask-bootstrap
RUN pip install Flask-Cors
RUN pip install google-cloud-firestore
RUN pip install google-cloud-logging
RUN pip install pytest

CMD python app.py