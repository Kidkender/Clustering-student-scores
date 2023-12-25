from enum import Enum


class Subject(Enum):
    TOAN = "Toán"
    LY = "Vật lý"
    HOA = "Hóa học"
    SINH = "Sinh học"
    LICH_SU = "Lịch sử"
    DIA_LY = "Địa lý"
    TIENG_ANH = "Tiếng Anh"
    VAN = "Văn"
    GDCD = "Giáo dục công dân"
    KHXH = "Khoa học xã hội"
    TIENG_VIET = "Tiếng Việt"
    TIENG_NGA = "Tiếng Nga"
    TIENG_PHAP = "Tiếng Pháp"
    TIENG_TRUNG = "Tiếng Trung"
    TIENG_DUC = "Tiếng Đức"


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
    B05 = [Subject.TOAN, Subject.SINH, Subject.KHXH]
    C00 = [Subject.VAN, Subject.LICH_SU, Subject.DIA_LY]
    C01 = [Subject.VAN, Subject.TOAN, Subject.LY]
    C02 = [Subject.VAN, Subject.TOAN, Subject.HOA]
    C03 = [Subject.VAN, Subject.TOAN, Subject.LICH_SU]
    C04 = [Subject.VAN, Subject.TOAN, Subject.DIA_LY]
    C05 = [Subject.VAN, Subject.LY, Subject.HOA]
    D01 = [Subject.VAN, Subject.TOAN, Subject.TIENG_ANH]
    D02 = [Subject.VAN, Subject.TOAN, Subject.TIENG_NGA]
    D03 = [Subject.VAN, Subject.TOAN, Subject.TIENG_PHAP]
    D04 = [Subject.VAN, Subject.TOAN, Subject.TIENG_TRUNG]
    D05 = [Subject.VAN, Subject.TOAN, Subject.TIENG_DUC]


combination_mapping = {
    Subject.TOAN: [Combination.A00, Combination.A01, Combination.A02, Combination.A03, Combination.A04,
                   Combination.A05, Combination.B00, Combination.B01, Combination.B02, Combination.B03,
                   Combination.B04, Combination.B05, Combination.C00, Combination.C01, Combination.C02,
                   Combination.C03, Combination.C04, Combination.C05, Combination.D01, Combination.D02,
                   Combination.D03, Combination.D04, Combination.D05],
    Subject.LY: [Combination.A00, Combination.A01, Combination.A02, Combination.A03, Combination.A04,
                 Combination.A05, Combination.B00, Combination.B01, Combination.B02, Combination.B03,
                 Combination.B04, Combination.B05, Combination.C01, Combination.C02, Combination.C05],
    Subject.HOA: [Combination.A00, Combination.A02, Combination.A04, Combination.A05, Combination.B00,
                  Combination.B02, Combination.B05, Combination.C02, Combination.C05],
    Subject.SINH: [Combination.A02, Combination.B00, Combination.B02, Combination.B03, Combination.B04,
                   Combination.B05],
    Subject.LICH_SU: [Combination.A03, Combination.A05, Combination.B01, Combination.B03, Combination.C00,
                      Combination.C03],
    Subject.DIA_LY: [Combination.A04, Combination.B02, Combination.B04, Combination.C00, Combination.C04],
    Subject.TIENG_ANH: [Combination.A01, Combination.D01],
    Subject.VAN: [Combination.C00, Combination.C01, Combination.C02, Combination.C03, Combination.C04,
                  Combination.C05, Combination.D01, Combination.D02, Combination.D03, Combination.D04,
                  Combination.D05],
    Subject.GDCD: [Combination.B04],
    Subject.KHXH: [Combination.B05],
    Subject.TIENG_NGA: [Combination.D02],
    Subject.TIENG_PHAP: [Combination.D03],
    Subject.TIENG_TRUNG: [Combination.D04],
    Subject.TIENG_DUC: [Combination.D05]
}


# print(Combination.A01.value)

def find_keys(enum_class, value):
    keys = []
    for key, member in enum_class.__members__.items():
        if member.value == value:
            keys.append(key)
    return keys


a01_keys = find_keys(
    Combination, [Subject.TOAN, Subject.LY, Subject.HOA])

all_combination_keys = list(Combination.__members__.keys())
all_subject_keys = list(Subject.__members__.keys())
print(all_subject_keys)
