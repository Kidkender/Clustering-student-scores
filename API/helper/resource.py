from flask_restx import Resource, abort, fields


class ResourceHelper(Resource):
    @staticmethod
    def handle_data_response(api, data):
        if not data.empty:
            return data.to_dict(orient="records")
        else:
            abort(404, message="No data available")
