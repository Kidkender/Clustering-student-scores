from routes.index import register_api_routes
from flask import Flask, json
from flask_restx import Api
from flask_cors import CORS

app = Flask(__name__)
CORS(app)
api = Api(app)

register_api_routes(app, api)

if __name__ == '__main__':
    app.run(debug=True)
