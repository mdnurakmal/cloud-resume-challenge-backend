# Use the official Python image.
FROM python:3.7

COPY . .

RUN pip install Flask

EXPOSE 8000

CMD python main.py