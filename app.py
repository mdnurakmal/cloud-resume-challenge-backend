from flask import Flask
from distributed_counters import increment
from flask_cors import CORS
import json
import os

app = Flask(__name__)
CORS(app)

@app.route('/', methods=['GET'])
def welcome(request):
    # For more information about CORS and CORS preflight requests, see:
    # https://developer.mozilla.org/en-US/docs/Glossary/Preflight_request

    # Set CORS headers for the preflight request
    if request.method == 'OPTIONS':
        # Allows GET requests from any origin with the Content-Type
        # header and caches preflight response for an 3600s
        headers = {
            'Access-Control-Allow-Origin': 'https://oneclicklaunch.com',
            'Access-Control-Allow-Methods': 'GET',
            'Access-Control-Allow-Headers': 'Content-Type',
            'Access-Control-Max-Age': '3600'
        }

        return ('', 204, headers)

    # Set CORS headers for the main request
    headers = {
        'Access-Control-Allow-Origin': '*'
    }

    return ('Hello World!', 200, headers)


if __name__ == "__main__":
    app.run(debug=True,host='0.0.0.0',port=int(os.environ.get('PORT', 8080)))