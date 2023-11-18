from flask import Flask, jsonify, request
from database_queries import (
    get_score_subject_semester,
    get_data_grade,
    get_score_Avg_Semester,
    get_score_Avg_year,
    get_Score_Group,
    get_Subject_From_Top5Avg
)
from utils.subject_grade_utils import is_subject_valid, is_group_subject
from utils.string_utils import isNull
from errors.error_exception import error_response
from utils.semester_grade_util import is_semester_valid, is_grade_valid
from handle.cluster import cluster_data

app = Flask(__name__)


@app.route('/api/get_score_subject_semester', methods=['GET'])
def api_get_score_subject_semester():
    subject = is_subject_valid(request.args.get('subject'))
    semester = is_semester_valid(int(request.args.get('semester')))
    print("Semester ", semester)
    if isNull(subject) or isNull(semester) == True:
        return error_response("Invalid or missing paramester!", 400)

    result = get_score_subject_semester(subject, semester)
    return jsonify(result.to_dict(orient='records'))

# Endpoint để lấy điểm năm theo khối và môn


@app.route('/api/get_data_grade', methods=['GET'])
def api_get_data_grade():
    subject = is_subject_valid(request.args.get('subject'))
    grade = is_grade_valid(int(request.args.get('grade')))
    print("grade ", grade)
    if isNull(subject) or isNull(grade):
        return error_response("Invalid or missing paramester!", 400)

    result = get_data_grade(subject, grade)
    return jsonify(result.to_dict())

# Endpoint để lấy điểm trung bình của một kỳ học


@app.route('/api/get_score_Avg_Semester', methods=['GET'])
def api_get_score_Avg_Semester():
    semester = is_semester_valid(int(request.args.get('semester')))
    if isNull(semester):
        return error_response("Invalid or missing paramester!", 400)

    result = get_score_Avg_Semester(semester)
    return jsonify(result.to_dict(orient='records'))

# Endpoint để lấy điểm trung bình của một năm học


@app.route('/api/get_score_Avg_year', methods=['GET'])
def api_get_score_Avg_year():
    grade = is_grade_valid(int(request.args.get('grade')))
    if isNull(grade):
        return error_response("Invalid or missing paramester!", 400)
    result = get_score_Avg_year(grade)
    # return jsonify(result.to_dict(orient='records'))
    return jsonify(result.to_dict())


# Endpoint để lấy điểm tổ hợp môn


@app.route('/api/get_Score_Group', methods=['GET'])
def api_get_Score_Group():
    group = request.args.get('group')
    grade = is_grade_valid(int(request.args.get('grade')))
    if isNull(grade) or isNull(group):
        return error_response("Invalid or missing paramester!", 400)
    result = get_Score_Group(group, grade)
    response = jsonify(result.to_dict(orient='records')
                       ) if result is not None else jsonify(result.to_dict())
    return response

# Endpoint để lấy top 5 môn có điểm trung bình cao nhất


@app.route('/api/get_Subject_From_Top5Avg', methods=['GET'])
def api_get_Subject_From_Top5Avg():
    grade = is_grade_valid(int(request.args.get('grade')))
    student_code = request.args.get('student_code')
    if isNull(grade) or isNull(student_code):
        return error_response("Invalid or missing paramester!", 400)
    result = get_Subject_From_Top5Avg(int(grade), student_code)
    return jsonify(result.to_dict(orient='records'))


@app.route('/api/cluster_by_subject', methods=['POST'])
def api_cluster_by_subject():
    try:
        data = request.json.get('data')
        n_clusters = request.json.get('n_clusters')

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


if __name__ == '__main__':
    app.run(debug=True)
