from itertools import combinations
from database_queries import get_Subject_From_Top5Avg
from enumeration import semester, subject, group_type
import constant
from handle import score


def create_groupSubject_From_Top5(student_code, semester):
    list_group_3 = []
    list_group_2 = []
    top_5_subject_Avg = get_Subject_From_Top5Avg(semester, student_code)

    combinations_3 = list(combinations(
        top_5_subject_Avg["subject"].to_numpy(), 3))
    for combination in combinations_3:
        list_group_3.append(list(combination))

    combinations_2 = list(combinations(
        top_5_subject_Avg["subject"].to_numpy(), 2))
    for combination in combinations_2:
        list_group_2.append(list(combination))

    return list_group_3, list_group_2


def find_single_group_subject(code_student, option):
    list_result = []

    label = group_type.Recommend_Type.MAIN_RECOMMEND.value
    value = semester.get_group_recommend_value(option)

    if value is None:
        raise Exception("Invalid option")

    if type(value) in (tuple, list):
        raise Exception("Invalid option")

    listGroup_3, list_group_2 = create_groupSubject_From_Top5(
        code_student, value)

    for item in listGroup_3:
        result = subject.get_combination_by_subjects(item[0], item[1], item[2])
        if (result != None):
            list_result.append(result)

    if len(list_result) == 0:
        for item in list_group_2:
            result = subject.get_combinations_with_subjects(item[0], item[1])
            if (result != None):
                list_result.append(result)
        list_result = [item for sublist in list_result for item in sublist]
        label = group_type.Recommend_Type.SUB_RECOMMEND.value

    return list_result, label


def recommend_single_grade(code_student, option):
    list_result = []
    recommend_level1 = []
    recommend_level2 = []
    recommend_level3 = []
    other_recommend = []

    value = semester.get_group_recommend_value(option)

    if value is None:
        raise Exception("Invalid option")

    listGroup, label = find_single_group_subject(code_student, option)
    for result in listGroup:

        if result is not None:
            list_result.append(result)
            last_digit = int(result[-1])
            if last_digit == 0:
                recommend_level1.append(result)
            elif last_digit == 1:
                recommend_level2.append(result)
            elif last_digit == 2:
                recommend_level3.append(result)
            else:
                other_recommend.append(result)

    recommendations = {
        "level_1": recommend_level1,
        "level_2": recommend_level2,
        "level_3": recommend_level3,
        "other_recommend": other_recommend
    }

    return recommendations, label


def recommend_combination(code_student, option):
    reccommend = ""
    label = ""
    grades = semester.get_group_recommend_value(option)
    if grades is None:
        raise Exception(constant.ERROR_OPTION_GRADE_INVALID)

    if type(grades) in (tuple, list):
        reccommend, label = score.recommend_muti_grade(code_student, option)
    else:
        reccommend, label = recommend_single_grade(code_student, option)

    return reccommend, label


def find_group_subject(code_student, option):
    result = ""
    label = ""
    grades = semester.get_group_recommend_value(option)

    if grades is None:
        raise Exception(constant.ERROR_OPTION_GRADE_INVALID)

    if type(grades) in (tuple, list):
        result, label = score.find_group_subject_muti_grade(
            code_student, option)
    else:
        result, label = find_single_group_subject(code_student, option)

    return result, label
