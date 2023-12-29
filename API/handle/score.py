from model.enum import semester
from database_queries import get_score_by_student_id


def calculate_muti_grade(code_student, option):
    score = semester.get_group_recommend_value(option)

    return score
