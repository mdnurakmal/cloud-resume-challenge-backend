from flask import Flask
import json

from app import app

def test_hello():
    response = app.test_client().get('/')

    assert response.status_code == 200
    assert list(response.json.keys())[0] == 'count'

    