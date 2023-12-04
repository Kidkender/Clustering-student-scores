from flask import Flask
from routes.index import register_api_routes
app = Flask(__name__)


register_api_routes(app)


if __name__ == '__main__':
    app.run(debug=True)
