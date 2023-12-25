from flask_restx import reqparse

scoreRequest = reqparse.RequestParser()


scoreRequest.add_argument(
    'grade', type=int, required=True, help='Grade is required')
scoreRequest.add_argument('group', required=True, help='Group is required')
