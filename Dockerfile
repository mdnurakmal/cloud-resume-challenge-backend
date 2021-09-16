# Use the official Python image.
FROM python:3.7

COPY . .

RUN pip install flask gunicorn
RUN pip install flask-wtf
RUN pip install flask-bootstrap
RUN pip install google-cloud-firestore
RUN chmod +x init.sh

CMD ./init.sh