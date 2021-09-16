# Use the official Python image.
FROM python:3.7

COPY . .

RUN pip install flask gunicorn
RUN pip install flask-wtf
RUN pip install flask-bootstrap

EXPOSE $PORT

CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 app:app