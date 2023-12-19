import numpy as np
from database_queries import get_Score_Group


def Avg_Score(score):
    return round(np.mean(score), 2)


def calculate_avgScore_group(group, grade):
    data_Score_Group = get_Score_Group(group, grade)
    list_Score = data_Score_Group.apply(Avg_Score, axis=1)
    return list_Score
