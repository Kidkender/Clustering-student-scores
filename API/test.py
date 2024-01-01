from enumeration import semester, subject, group_type
from database_queries import get_score_by_student_id
from itertools import combinations


def recommend_muti_grade(code_student, option):
    score_options = semester.get_group_recommend_value(option)
    listScore = get_score_by_student_id(code_student)

    filtered_score = listScore[listScore['Ky'].isin(score_options)]

    average_scores = filtered_score.groupby(
        ['MaHocSinh', 'TenHocSinh']).mean()

    result = average_scores.reset_index().drop(
        columns=['MaHocSinh', 'TenHocSinh', 'Ky'])

    top_5_subjects = get_top_5_subjects(result)
    list_group_3, list_group_2 = create_combination(top_5_subjects)
    label, list_recommend = find_group_subject(list_group_3, list_group_2)

    recommend = recommend_combination(list_recommend)

    return label, recommend


def get_top_5_subjects(average_scores):
    top_5_subjects = average_scores.apply(
        lambda x: ', '.join(x.nlargest(5).index.tolist()), axis=1)
    return top_5_subjects


def create_combination(subjects):
    list_group_3 = []
    list_group_2 = []
    subjects_list = subjects.str.split(',').explode().str.strip().tolist()

    combinations_3 = list(combinations(
        subjects_list, 3))
    for combination in combinations_3:
        list_group_3.append(list(combination))

    combinations_2 = list(combinations(
        subjects_list, 2))
    for combination in combinations_2:
        list_group_2.append(list(combination))

    return list_group_3, list_group_2


def find_group_subject(listGroup_3, listGroup_2):
    list_result = []
    label = group_type.Recommend_Type.MAIN_RECOMMEND.value

    for item in listGroup_3:
        result = subject.get_combination_by_subjects(item[0], item[1], item[2])
        if (result != None):
            list_result.append(result)

    if len(list_result) == 0:
        for item in listGroup_2:
            result = subject.get_combinations_with_subjects(item[0], item[1])
            if (result != None):
                list_result.append(result)
        list_result = [item for sublist in list_result for item in sublist]
        label = group_type.Recommend_Type.SUB_RECOMMEND.value

    return label, list_result


def recommend_combination(listGroup):
    list_result = []
    recommend_level1 = []
    recommend_level2 = []
    recommend_level3 = []
    other_recommend = []

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

    return recommendations


label, recommend = recommend_muti_grade("1703323069", "GRADE_10_11")
print(label)
print(recommend)
