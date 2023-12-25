from flask_restx import fields

cluster_model = {
    'cluster_centers': fields.List(fields.Float),
    'labels': fields.List(fields.Integer),
    'clustered_data': fields.Raw
}

response_model = {
    'result': fields.Raw,
    'cluster_data': fields.Nested(cluster_model)
}


def handle_response(result, cluster_centers, labels, clustered_data):
    return {
        'result': result,
        'cluster_data': {
            'cluster_centers': cluster_centers,
            'labels': labels,
            'clustered_data': clustered_data
        }
    }
