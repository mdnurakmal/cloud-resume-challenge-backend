# Use the official Python image.
FROM python:3.7

COPY . .

RUN pip install Flask

CMD python main.py