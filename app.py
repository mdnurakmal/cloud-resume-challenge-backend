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

    return json.dumps(value)


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))