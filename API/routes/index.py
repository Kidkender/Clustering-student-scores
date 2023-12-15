from flask import jsonify, request
from database_queries import get_data_grade, get_score_Avg_Semester, get_score_Avg_year
from database_queries import get_score_subject_semester
from database_queries import (
    get_Score_Group,
    get_Subject_From_Top5Avg
)
from model.request.ApiRequest import GradeClusterReq, GradeGroupReq, GradeStudentReq, SemesterClusterReq, SubjectGradeReq, SubjectSemesterReq
from errors.error_exception import error_response
from handle.cluster import cluster_data
from handle.recommendations import create_groupSubject_From_Top5, reverse_group_subject, find_group_subject, recommend_group
from model.response.index import ApirResponse
from database_queries import get_students, get_RateResult, get_score_students


def register_api_routes(app):
    @app.route("/api/students", methods=["GET"])
    def api_students():
        students = get_students()
        if students is not None and not students.empty:
            student_dict = students.to_dict(orient="records")
            return jsonify(student_dict)
        else:
            return jsonify({"error": "No students data available"}),

    @app.route("/api/rates", methods=["GET"])
    def api_rates():
        rate = get_RateResult()
        if rate is not None and not rate.empty:
            rate_dict = rate.to_dict(orient="records")
            return jsonify(rate_dict)
        else:
            return jsonify({"error": "No rates data available"}), 404

    @app.route("/api/scores", methods=["GET"])
    def api_scores():
        score = get_score_students()
        if score is not None and not score.empty:
            score_dict = score.to_dict(orient="records")
            return jsonify(score_dict)
        else:
            return jsonify({"error": "No score data available"}), 404

    @app.route('/api/score-subject-semester', methods=['GET'])
    def api_score_subject_semester():

        req = SubjectSemesterReq(request.args)
        if not req.is_valid():
            return error_response("Invalid or missing parameter!", 400)

        result = get_score_subject_semester(req.subject, req.semester)

        cluster_centers, labels, clustered_data = cluster_data(
            result, req.n_clusters)

        api_response = ApirResponse(
            result, (cluster_centers, labels, clustered_data))

        return jsonify(api_response.to_dict_records())

    @app.route('/api/data_grade', methods=['GET'])
    def api_get_data_grade():
        api_request = SubjectGradeReq(request.args)

        if not api_request.is_valid():
            return error_response("Invalid or missing parameter!", 400)

        result = get_data_grade(api_request.subject, api_request.grade)
        cluster_centers, labels, clustered_data = cluster_data(
            result, api_request.n_clusters)

        api_response = ApirResponse(
            result, (cluster_centers, labels, clustered_data))

        return jsonify(api_response.to_dict_records())

    @app.route('/api/score_Avg_Semester', methods=['GET'])
    def api_get_score_Avg_Semester():
        api_request = SemesterClusterReq(request.args)

        if not api_request.is_valid():
            return error_response("Invalid or missing parameter!", 400)

        result = get_score_Avg_Semester(api_request.semester)
        cluster_centers, labels, clustered_data = cluster_data(
            result, api_request.n_clusters)

        api_response = ApirResponse(
            result, (cluster_centers, labels, clustered_data))

        return jsonify(api_response.to_dict())

    @app.route('/api/score_Avg_year', methods=['GET'])
    def api_get_score_Avg_year():
        api_request = GradeClusterReq(request.args)

        if not api_request.is_valid():
            return error_response("Invalid or missing parameter!", 400)
        result = get_score_Avg_year(api_request.grade)

        cluster_centers, labels, clustered_data = cluster_data(
            result, api_request.n_clusters)

        api_response = ApirResponse(
            result, (cluster_centers, labels, clustered_data))

        return jsonify(api_response.to_dict())

    @app.route('/api/get_Score_Group', methods=['GET'])
    def api_get_Score_Group():
        api_request = GradeGroupReq(request.args)

        if not api_request.is_valid():
            return error_response("Invalid or missing parameter!", 400)

        result = get_Score_Group(api_request.group, api_request.grade)
        response = jsonify(result.to_dict(orient='records')
                           ) if result is not None else jsonify(result.to_dict())
        return response

    @app.route('/api/get_Subject_From_Top5Avg', methods=['GET'])
    def api_get_Subject_From_Top5Avg():
        api_request = GradeStudentReq(request.args)

        if not api_request.is_valid():
            return error_response("Invalid or missing parameter!", 400)

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

            cluster_centers, labels, clustered_data = cluster_data(
                data, n_clusters)

            result = {
                "cluster_centers": cluster_centers.tolist(),
                "labels": labels.tolist(),
                "clustered_data": clustered_data.tolist()
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
            result = reverse_group_subject(capitalized_subjects)

            return jsonify({"result": result}), 200 if result else 404

        except Exception as e:
            return jsonify({"error": str(e)}), 500

    @app.route('/api/find_group_subject', methods=['GET'])
    def api_find_group_subject():
        code_student = request.args.get('code_student')

        if code_student is None:
            return jsonify({"error": "Missing 'code_student' parameter"}), 400

        result = find_group_subject(code_student)
        return jsonify({"result": result})

    @app.route('/api/recommend_group', methods=['GET'])
    def api_recommend_group():
        code_student = request.args.get('code_student')

        if code_student is None:
            return jsonify({"error": "Missing 'code_student' parameter"}), 400

        result = recommend_group(code_student)
        return jsonify({"result": result})
