from flask import Flask
from distributed_counters import increment,getVisitorCount,init
from flask_cors import CORS
import json
import os

app = Flask(__name__)
cors = CORS(app, resources={r"/*": {"origins": "https://www.oneclicklaunch.com"}})

@app.route('/increment', methods=['GET'])
def welcome():

    increment()

    value ={
        "count" : getVisitorCount()
    }

   
    return value

# Initialize firestore
def setup_app(app):
    init()


setup_app(app)

if __name__ == "__main__":
    app.run(debug=True,host='0.0.0.0',port=int(os.environ.get('PORT', 8080)))