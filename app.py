from flask import Flask
from distributed_counters import increment
from flask_cors import CORS
import json

app = Flask(__name__)
CORS(app)

@app.route('/increment/', methods=['GET', 'POST'])
def welcome():
    print("hello")
    increment()

    value ={
        "count" : "1"
    }

    response = flask.jsonify({'some': 'data'})
    response.headers.add('Access-Control-Allow-Origin', '*')
    return response


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))