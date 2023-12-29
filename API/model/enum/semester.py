from enum import Enum


class semester(Enum):
    S1_GRADE10 = 1
    S2_GRADE10 = 2
    S1_GRADE11 = 3
    S2_GRADE11 = 4
    S1_GRADE12 = 5


class GroupRecommend(Enum):
    GRADE_10 = 2
    GRADE_11 = 4
    GRADE_12 = 5
    GRADE_10_11 = (2, 4)
    GRADE_10_11_12 = (2, 4, 5)


"""_Get list option to recommend
"""


def get_list_recommend_option():
    return list(GroupRecommend.__members__.keys())


def is_valid_group_recommend(key):
    return key in GroupRecommend.__members__


def get_group_recommend_value(key):
    return GroupRecommend[key].value if key in GroupRecommend.__members__ else None
