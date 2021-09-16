# Use the official Python image.
FROM python:3.7

COPY . .

RUN pip install Flask

EXPOSE $PORT

CMD python main.py