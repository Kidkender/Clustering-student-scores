# recommendations.py

from itertools import combinations
from database_queries import get_Subject_From_Top5Avg
from utils.subject_grade_utils import reverse_group_subject


def create_group_subject_from_top5(top5_subject):
    list_group = []
    combinations_3 = list(combinations(top5_subject, 3))
    print("Các tổ hợp 3 phần tử:")
    for combination in combinations_3:
        list_group.append(list(combination))
    return list_group


def find_group_subject(list_group):
    list_result = []
    for item in list_group:
        result = reverse_group_subject(item)
        if result is not None:
            list_result.append(result)

    print(list_result)
    return list_result


def recommend_group(top5_subject):
    list_result = []
    recommend_level1 = []
    recommend_level2 = []
    recommend_level3 = []
    total_recommend = []
    Top5Subject = get_Subject_From_Top5Avg(12, "1703323069")
    listGroup = create_group_subject_from_top5(Top5Subject)
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
