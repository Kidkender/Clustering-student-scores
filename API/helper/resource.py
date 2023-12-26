from flask_restx import Resource
from errors.error_exception import NoDataAvailableException


class ResourceHelper(Resource):
    @staticmethod
    def handle_data_response(api, data):
        if not data.empty:
            return data.to_dict(orient="records")
        else:
            raise NoDataAvailableException()
