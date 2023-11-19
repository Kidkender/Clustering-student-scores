from utils.string_utils import isNull


def is_semester_valid(semester):
    if semester >= 1 and semester <= 5:
        return semester
    return None


def is_grade_valid(grade):
    if grade >= 10 and grade <= 12:
        return grade
    return None
