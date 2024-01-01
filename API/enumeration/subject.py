from enum import Enum


class Subject(Enum):
    TOAN = "Toan"
    LY = "Li"
    HOA = "Hoa"
    SINH = "Sinh"
    LICH_SU = "Su"
    DIA_LY = "Dia"
    TIENG_ANH = "Ngoai_Ngu"
    VAN = "Van"
    GDCD = "GDCD"
    KHXH = "Khoa học xã hội",
    CONG_NGHE = "Cong_Nghe"
    TIENG_NGA = "Tieng_Nga"
    TIENG_PHAP = "Tieng_Phap"
    TIENG_TRUNG = "Tieng_Trung"
    TIENG_DUC = "Tieng_Duc"


class Combination(Enum):
    A00 = [Subject.TOAN, Subject.LY, Subject.HOA]
    A01 = [Subject.TOAN, Subject.LY, Subject.TIENG_ANH]
    A02 = [Subject.TOAN, Subject.LY, Subject.SINH]
    A03 = [Subject.TOAN, Subject.LY, Subject.LICH_SU]
    A04 = [Subject.TOAN, Subject.LY, Subject.DIA_LY]
    A05 = [Subject.TOAN, Subject.HOA, Subject.LICH_SU]
    B00 = [Subject.TOAN, Subject.HOA, Subject.SINH]
    B01 = [Subject.TOAN, Subject.SINH, Subject.LICH_SU]
    B02 = [Subject.TOAN, Subject.SINH, Subject.DIA_LY]
    B03 = [Subject.TOAN, Subject.SINH, Subject.VAN]
    B04 = [Subject.TOAN, Subject.SINH, Subject.GDCD]
    C00 = [Subject.VAN, Subject.LICH_SU, Subject.DIA_LY]
    C01 = [Subject.VAN, Subject.TOAN, Subject.LY]
    C02 = [Subject.VAN, Subject.TOAN, Subject.HOA]
    C03 = [Subject.VAN, Subject.TOAN, Subject.LICH_SU]
    C04 = [Subject.VAN, Subject.TOAN, Subject.DIA_LY]
    C05 = [Subject.VAN, Subject.LY, Subject.HOA]
    D01 = [Subject.VAN, Subject.TOAN, Subject.TIENG_ANH]


combination_mapping = {
    Subject.TOAN: [Combination.A00, Combination.A01, Combination.A02, Combination.A03, Combination.A04,
                   Combination.A05, Combination.B00, Combination.B01, Combination.B02, Combination.B03,
                   Combination.B04, Combination.C00, Combination.C01, Combination.C02,
                   Combination.C03, Combination.C04, Combination.C05, Combination.D01],
    Subject.LY: [Combination.A00, Combination.A01, Combination.A02, Combination.A03, Combination.A04,
                 Combination.A05, Combination.B00, Combination.B01, Combination.B02, Combination.B03,
                 Combination.B04, Combination.C01, Combination.C02, Combination.C05],
    Subject.HOA: [Combination.A00, Combination.A02, Combination.A04, Combination.A05, Combination.B00,
                  Combination.B02, Combination.C02, Combination.C05],
    Subject.SINH: [Combination.A02, Combination.B00, Combination.B02, Combination.B03, Combination.B04,
                   ],
    Subject.LICH_SU: [Combination.A03, Combination.A05, Combination.B01, Combination.B03, Combination.C00,
                      Combination.C03],
    Subject.DIA_LY: [Combination.A04, Combination.B02, Combination.B04, Combination.C00, Combination.C04],
    Subject.TIENG_ANH: [Combination.A01, Combination.D01],
    Subject.VAN: [Combination.C00, Combination.C01, Combination.C02, Combination.C03, Combination.C04,
                  Combination.C05, Combination.D01],
    Subject.GDCD: [Combination.B04],
}


def get_list_group_subject():
    return list(Combination.__members__.keys())

# print(Combination.A01.value)


def find_keys(enum_class, value):
    keys = []
    for key, member in enum_class.__members__.items():
        if member.value == value:
            keys.append(key)
    return keys


all_combination_keys = list(Combination.__members__.keys())
all_subject_keys = list(Subject.__members__.keys())

"""_summary_
    Get combination
    @param: string of name combination name
    Example "A01" "B01"
"""


def get_subject_values(combination_str):
    try:
        combination_enum = Combination[combination_str]
        return [subject.value for subject in combination_enum.value]
    except KeyError:
        return None


values_of_A01 = get_subject_values('A00')

# print(values_of_A01)


def get_combination_by_subjects(subject1, subject2, subject3):
    subjects = [subject1.lower(), subject2.lower(), subject3.lower()]
    for combination in Combination:
        if set(subject.value.lower() for subject in combination.value) == set(subjects):
            return combination.name

    return None


def get_combinations_with_subjects(subject1, subject2):

    subject1 = Subject(subject1)
    subject2 = Subject(subject2)
    valid_combinations = set()

    for combination_list in combination_mapping.values():
        for combination in combination_list:
            if subject1 in combination.value and subject2 in combination.value:
                valid_combinations.add(combination.name)

    return list(valid_combinations)
