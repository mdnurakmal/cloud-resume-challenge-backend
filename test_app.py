from flask import Flask
from distributed_counters import increment,getVisitorCount
from flask_cors import CORS
import json
import os

from app import app


def test_init():
    result = app.test_client().init()
    assert result == "Initialized"



def test_hello():
    response = app.test_client().get('/increment')

    assert response.status_code == 200
    print("Response code passed")
    assert list(response.json.keys())[0] == 'count'
    assert type(response.json['count']) is int 
    print("JSON received passed")
    assert response.headers["Access-Control-Allow-Origin"] == "https://www.oneclicklaunch.com"
    print("CORS passed")


    