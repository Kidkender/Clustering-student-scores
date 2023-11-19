# recommendations.py

from itertools import combinations
from database_queries import get_Subject_From_Top5Avg
from utils.subject_grade_utils import reverse_group_subject


def create_groupSubject_From_Top5(student_code):
    list_group = []
    top_5_subject_Avg = get_Subject_From_Top5Avg(12, student_code)
    combinations_3 = list(combinations(
        top_5_subject_Avg["subject"].to_numpy(), 3))
    for combination in combinations_3:
        list_group.append(list(combination))
    return list_group


subjects_input = ["Toan", "Van", "Ngoai_Ngu"]


def find_group_subject(code_student):
    list_result = []
    listGroup = create_groupSubject_From_Top5(code_student)
    print("data ", listGroup)
    for item in listGroup:
        result = reverse_group_subject(item)
        if (result != None):
            list_result.append(result)
    print("list result", list_result)
    return list_result


def recommend_group(code_student):
    list_result = []
    recommend_level1 = []
    recommend_level2 = []
    recommend_level3 = []
    listGroup = create_groupSubject_From_Top5(code_student)
    for item in listGroup:
        result = reverse_group_subject(item)
        if result is not None:
            list_result.append(result)
            # Lấy số cuối cùng của chuỗi và chuyển thành số nguyên
            last_digit = int(result[-1])
            if last_digit == 0:
                recommend_level1.append(result)
            elif last_digit == 1:
                recommend_level2.append(result)
            elif last_digit == 2:
                recommend_level3.append(result)

    recommendations = {
        "level_1": recommend_level1,
        "level_2": recommend_level2,
        "level_3": recommend_level3
    }

    return recommendations
