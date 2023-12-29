from flask import jsonify, request
from database_queries import (
    get_data_grade,
    get_score_Avg_Semester,
    get_score_Avg_year
)
from database_queries import (
    get_Score_Group,
    get_score_subject_semester,
    get_Subject_From_Top5Avg
)
from model.request.ApiRequest import (
    GradeClusterReq,
    GradeGroupReq,
    GradeStudentReq,
    SemesterClusterReq,
    SubjectGradeReq,
    SubjectSemesterReq
)
from errors.error_exception import (
    CustomException,
    NoDataAvailableException
)
from errors.error_exception import DatabaseConnectionError

from handle.cluster import cluster_data
from handle.recommendations import (
    create_groupSubject_From_Top5,

    find_group_subject,
    recommend_group)
from model.response.index import ApirResponse
from database_queries import (
    get_students,
    get_RateResult,
    get_student_by_id,
    get_score_students,
    get_score_by_student_id,
    get_rate_by_student_id,
    get_score_by_semester
)
from model.enum import subject
from model.response.student import student_model
from model.response.rate import rate_model
from model.response.score import score_model
from helper.resource import ResourceHelper
from model.request.score_group import scoreRequest
from flask_restx import Resource


def register_api_routes(app, api):
    class StudentResource(ResourceHelper):
        @api.marshal_with(student_model)
        def get(self, code_student):
            students = get_student_by_id(code_student)
            return self.handle_data_response(api, students)

    class StudentsResource(ResourceHelper):
        @api.marshal_with(student_model)
        def get(self):
            students = get_students()
            return self.handle_data_response(api, students)

    class RateByIdResource(ResourceHelper):
        @api.marshal_with(rate_model)
        def get(self, code_student):
            rate = get_rate_by_student_id(code_student)
            return self.handle_data_response(api, rate)

    class RatesResource(ResourceHelper):
        @api.marshal_with(rate_model)
        def get(self):
            rates = get_RateResult()
            return self.handle_data_response(api, rates)

    class ScoreResource(ResourceHelper):
        @api.marshal_with(score_model)
        def get(self, code_student):
            score = get_score_by_student_id(code_student)
            return self.handle_data_response(api, score)

    class ScoresResource(ResourceHelper):
        @api.marshal_with(score_model)
        def get(self):
            scores = get_score_students()
            return self.handle_data_response(api, scores)

    @app.route('/api/score-subject-semester', methods=['GET'])
    def api_score_subject_semester():

        req = SubjectSemesterReq(request.args)
        if not req.is_valid():
            return CustomException("Invalid or missing parameter!", 400)

        result = get_score_subject_semester(req.subject, req.semester)

        cluster_centers, labels, clustered_data, cluster_count = cluster_data(
            result, req.n_clusters)

        api_response = ApirResponse(
            result, (cluster_centers, labels, clustered_data, cluster_count))

        return jsonify(api_response.to_dict_records())

    class GradeGroupResource(Resource):
        @api.expect(scoreRequest)
        @api.marshal_with(score_model)
        def get(self):
            args = scoreRequest.parse_args()
            api_request = GradeGroupReq(args)

            if not api_request.is_valid():
                api.abort(400, "Invalid or missing parameter!")

            result = get_Score_Group(api_request.group, api_request.grade)
            return result.to_dict(orient='records') if result is not None else result.to_dict()

    @app.route('/api/data_grade', methods=['GET'])
    def api_get_data_grade():
        api_request = SubjectGradeReq(request.args)

        if not api_request.is_valid():
            return CustomException("Invalid or missing parameter!", 400)

        result = get_data_grade(api_request.subject, api_request.grade)

        cluster_centers, labels, clustered_data, cluster_count = cluster_data(
            result["Score_Avg"], api_request.n_clusters)

        api_response = ApirResponse(
            result, (cluster_centers, labels, clustered_data, cluster_count))

        return jsonify(api_response.to_dict_records())

    @app.route('/api/score_Avg_Semester', methods=['GET'])
    def api_get_score_Avg_Semester():
        api_request = SemesterClusterReq(request.args)

        if not api_request.is_valid():
            return CustomException("Invalid or missing parameter!", 400)

        result = get_score_Avg_Semester(api_request.semester)
        cluster_centers, labels, clustered_data, cluster_count = cluster_data(
            result, api_request.n_clusters)

        api_response = ApirResponse(
            result, (cluster_centers, labels, clustered_data, cluster_count))

        return jsonify(api_response.to_dict())

    @app.route('/api/score_Avg_year', methods=['GET'])
    def api_get_score_Avg_year():
        api_request = GradeClusterReq(request.args)

        if not api_request.is_valid():
            return CustomException("Invalid or missing parameter!", 400)
        result = get_score_Avg_year(api_request.grade)

        cluster_centers, labels, clustered_data, cluster_count = cluster_data(
            result, api_request.n_clusters)

        api_response = ApirResponse(
            result, (cluster_centers, labels, clustered_data, cluster_count))

        return jsonify(api_response.to_dict())

    @app.route('/api/get_Subject_From_Top5Avg', methods=['GET'])
    def api_get_Subject_From_Top5Avg():
        api_request = GradeStudentReq(request.args)

        if not api_request.is_valid():
            return CustomException("Invalid or missing parameter!", 400)

        result = get_Subject_From_Top5Avg(
            int(api_request.grade), api_request.student_code)
        return jsonify(result.to_dict(orient='records'))

    @app.route('/api/cluster_by_subject', methods=['POST'])
    def api_cluster_by_subject():
        try:
            data = request.json.get('data')
            n_clusters = request.json.get('n')

            if data is None or n_clusters is None:
                return jsonify({"error": "Invalid or missing parameters"}), 400

            cluster_centers, labels, clustered_data, cluster_count = cluster_data(
                data, n_clusters)

            result = {
                "cluster_centers": cluster_centers.tolist(),
                "labels": labels.tolist(),
                "clustered_data": clustered_data.tolist(),
                "cluster_count": cluster_count.tolist(),
            }

            return jsonify(result), 200

        except Exception as e:
            return jsonify({"error": str(e)}), 500

    @app.route("/api/create_group_subject_from_top5", methods=["POST"])
    def api_create_group_subject_from_top5():
        try:
            student_code = request.args.get("student_code")

            if student_code is None:
                return jsonify({"error": "Missing student code parameter"}, 400)

            result = create_groupSubject_From_Top5(student_code)
            return jsonify(result), 200

        except Exception as e:
            return jsonify({"error": str(e)}, 500)

    @app.route('/api/reverse_group_subject', methods=['POST'])
    def api_reverse_group_subject():
        try:
            subjects = request.args.get('subjects')

            if subjects is None:
                return jsonify({"error": "Missing subjects parameter"}), 400
            subjects = list(subjects.split(','))
            capitalized_subjects = [subject.capitalize()
                                    for subject in subjects]
            result = subject.get_combination_by_subjects(capitalized_subjects)

            return jsonify({"result": result}), 200 if result else 404

        except Exception as e:
            return jsonify({"error": str(e)}), 500

    @app.route('/api/find_group_subject', methods=['GET'])
    def api_find_group_subject():
        code_student = request.args.get('code_student')
        option = request.args.get('option')

        if code_student is None:
            return jsonify({"error": "Missing 'code_student' parameter"}), 400

        result = find_group_subject(code_student, option)
        return jsonify({"result": result})

    @app.route('/api/recommend_group', methods=['GET'])
    def api_recommend_group():
        code_student = request.args.get('code_student')
        option_recommend = request.args.get('option')

        if code_student is None:
            return jsonify({"error": "Missing 'code_student' parameter"}), 400

        result = recommend_group(code_student, option_recommend)
        return jsonify({"result": result})

    class ScoreSemesterResource(ResourceHelper):
        @api.marshal_with(score_model)
        def get(self, semester):
            score = get_score_by_semester(semester)
            return self.handle_data_response(api, score)

    @app.errorhandler(DatabaseConnectionError)
    def handle_database_connection_error(error):
        response = jsonify({"error": str(error)})
        response.status_code = 500
        return response

    @app.errorhandler(NoDataAvailableException)
    def handle_no_data_available_error(error):
        response = jsonify({"error": str(error)})
        response.status_code = 404
        return response

    api.add_resource(StudentsResource, '/api/students')
    api.add_resource(StudentResource, '/api/students/<code_student>')
    api.add_resource(RateByIdResource, "/api/rate/<string:code_student>")
    api.add_resource(RatesResource, "/api/rates")
    api.add_resource(ScoreResource, "/api/score/<code_student>")
    api.add_resource(ScoresResource, "/api/scores")
    api.add_resource(GradeGroupResource, '/api/get_Score_Group')
    api.add_resource(ScoreSemesterResource, "/api/scores/<semester>")
