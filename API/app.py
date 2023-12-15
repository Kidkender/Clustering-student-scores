from routes.index import register_api_routes
from flask import Flask
from flask_restx import Api

app = Flask(__name__)
api = Api(app)

register_api_routes(app)

if __name__ == '__main__':
    app.run(debug=True)
