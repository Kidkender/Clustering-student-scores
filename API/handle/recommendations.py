from itertools import combinations
from database_queries import get_Subject_From_Top5Avg
from model.enum import semester, subject


def create_groupSubject_From_Top5(student_code, grade):
    list_group = []
    top_5_subject_Avg = get_Subject_From_Top5Avg(grade, student_code)

    combinations_3 = list(combinations(
        top_5_subject_Avg["subject"].to_numpy(), 3))
    for combination in combinations_3:

        list_group.append(list(combination))
    return list_group


def find_group_subject(code_student, option):
    list_result = []
    value = semester.get_group_recommend_value(option)

    listGroup = create_groupSubject_From_Top5(code_student, value)
    for item in listGroup:
        result = subject.get_combination_by_subjects(item[0], item[1], item[2])
        print(result)
        if (result != None):
            list_result.append(result)
    return list_result


def calculate_score_muti_grade():
    return


def recommend_group(code_student, option):
    list_result = []
    recommend_level1 = []
    recommend_level2 = []
    recommend_level3 = []

    value = semester.get_group_recommend_value(option)

    if value is None:
        return Exception("Invalid option")

    listGroup = create_groupSubject_From_Top5(code_student, value)
    for item in listGroup:
        print("item: ", item)

        result = subject.get_combination_by_subjects(item[0], item[1], item[2])

        if result is not None:
            list_result.append(result)
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
