
def get_semester_grade(grade):
    print(grade)
    if grade == 10:
        semester_1 = 1
        semester_2 = 2
        return semester_1, semester_2
    elif grade == 11:
        semester_1 = 3
        semester_2 = 4
        return semester_1, semester_2
    elif grade == 12:
        semester_1 = 5
        semester_2 = 5
        return semester_1, semester_2


def is_subject_valid(subject):
    allowed_subjects = ["toan", "van", "anh", "sinh",
                        "su", "su", "dia", "li", "hoa", "ngoai_ngu", "cong_nghe"]
    if subject.lower() in allowed_subjects:
        return subject.lower()
    else:
        return None


def is_group_subject(group):
    subject_1 = ""
    subject_2 = ""
    subject_3 = ""
    if group == "A00":
        subject_1 = "Toan"
        subject_2 = "Li"
        subject_3 = "Hoa"
    elif group == "A01":
        subject_1 = "Toan"
        subject_2 = "Li"
        subject_3 = "Ngoai_Ngu"
    elif group == "A02":
        subject_1 = "Toan"
        subject_2 = "Li"
        subject_3 = "Sinh"
    elif group == "B00":
        subject_1 = "Toan"
        subject_2 = "Hoa"
        subject_3 = "Sinh"
    elif group == "C00":
        subject_1 = "Van"
        subject_2 = "Su"
        subject_3 = "Dia"
    elif group == "C01":
        subject_1 = "Toan"
        subject_2 = "Van"
        subject_3 = "Li"
    elif group == "C02":
        subject_1 = "Toan"
        subject_2 = "Van"
        subject_3 = "Hoa"
    elif group == "D00":
        subject_1 = "Toan"
        subject_2 = "Van"
        subject_3 = "Ngoai_Ngu"
    else:
        return None
    return subject_1, subject_2, subject_3


def Last_Semester_Of_Grade(grade):
    semester = 0
    if grade == 10:
        semester = 2
    elif grade == 11:
        semester = 4
    elif grade == 12:
        semester = 5
    else:
        raise Exception("Invalid grade")
    return semester
