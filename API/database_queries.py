from utils.subject_grade_utils import Last_Semester_Of_Grade, is_group_subject, get_semester_grade
from utils.db_utils import connect_to_database, close_connection, query_database


def execute_query(query):
    connection = connect_to_database()
    if connection:
        try:
            data = query_database(connection, query)
            if data is not None:
                return data
        finally:
            close_connection(connection)
    else:
        print("Couldn't connect to database")


def get_score_subject_semester(subject, semester):
    query = f"SELECT {subject} FROM diem where ky='{semester}'"
    data = execute_query(query)
    return data


def get_data_grade(subject, grade):
    semester_1, semester_2 = get_semester_grade(grade)

    if grade == 12:
        query = f"SELECT {subject} FROM diem where ky='{semester_1}'"
        data = execute_query(query)
        return data[f'{subject}']
    else:
        query = f"""
            SELECT
                MaHocSinh,
                ((SUM(CASE WHEN Ky = {semester_1} THEN {subject} ELSE 0 END) + 
                (SUM(CASE WHEN Ky = {semester_2} THEN {subject} ELSE 0 END) * 2)) / 3) AS Score_Avg
            FROM diem
            GROUP BY MaHocSinh
        """
        return execute_query(query)


def get_score_Avg_Semester(semester):
    query = f"SELECT MaHocSinh,ky,diemtongket FROM Ketquadanhgia where ky='{semester}'"
    data = execute_query(query)
    return data["diemtongket"]


def get_score_Avg_year(grade):
    semester_1, semester_2 = get_semester_grade(grade)
    if grade == 12:
        semester_2 = semester_1

    query = f"SELECT MaHocSinh,ky,diemtongket FROM Ketquadanhgia where ky='{semester_2}'"
    data = execute_query(query)
    return data["diemtongket"]


def get_Score_Group(group, grade):
    subjects = is_group_subject(group)
    semester = Last_Semester_Of_Grade(grade)

    if subjects is not None:
        subject_1, subject_2, subject_3 = subjects
    else:
        return None

    query = f"SELECT d.MaHocSinh, TenHocSinh, {subject_1},{subject_2},{subject_3} FROM diem d, hocsinh h where d.mahocsinh = h.mahocsinh and ky='{semester}'"
    return execute_query(query)


def get_Subject_From_Top5Avg(semester, student_code):
    query = f"""
            Select  top 5 value,subject from (
                Select Toan as value,subject='Toan' from diem where mahocsinh='{student_code}' and ky ={semester}
                Union
                Select Li as value ,subject='Li'from diem where mahocsinh='{student_code}' and ky ={semester}
                Union
                Select Hoa as value ,subject='Hoa'from diem where mahocsinh='{student_code}' and ky ={semester}
                Union
                Select Sinh value ,subject='Sinh' from diem where mahocsinh='{student_code}' and ky ={semester}
                Union
                Select Van as value ,subject='Van' from diem where mahocsinh='{student_code}' and ky ={semester}
                Union
                Select Su  as value ,subject='Su' from diem where mahocsinh='{student_code}' and ky ={semester}
                Union
                Select Dia as value ,subject='Dia' from diem where mahocsinh='{student_code}' and ky ={semester}
                Union
                Select Ngoai_Ngu as value ,subject='Ngoai_Ngu' from diem where mahocsinh='{student_code}' and ky ={semester}
            ) as t
            order by value desc
        """
    return execute_query(query)


def get_students():
    query = f"Select * from hocsinh"
    return execute_query(query)


def get_score_students():
    query = f"Select * from hocsinh h, diem d where h.MaHocSinh = d.MaHocSinh"
    return execute_query(query)


def get_RateResult():
    query = f"Select * from hocsinh h, KetQuaDanhGia k where h.MaHocSinh = k.MaHocSinh"
    return execute_query(query)


def get_student_by_id(id):
    query = f"Select * from hocsinh h where h.MaHocSinh = {id}"
    return execute_query(query)


def get_score_by_student_id(id):
    query = f"Select h.MaHocSinh, TenHocSinh,Ky, Toan, Li, Hoa,Sinh, Van, Su, Dia, Ngoai_Ngu, GDCD, Cong_Nghe from  diem d, hocsinh h where d.mahocsinh = h.mahocsinh and d.MaHocSinh = {id}"
    return execute_query(query)


def get_rate_by_student_id(id):
    query = f"SELECT * FROM KetQuaDanhGia k, hocsinh h WHERE k.mahocsinh = h.mahocsinh and k.MaHocSinh = {id}"
    return execute_query(query)


def get_score_by_semester(semester):
    query = f"SELECT * FROM diem d, hocsinh h WHERE h.MaHocSinh = d.MaHocSinh AND d.ky = {semester}"
    return execute_query(query)


def get_all_score_by_semester(semester):
    query = f"SELECT Toan, Li, Hoa, Sinh, Van, Su, Dia, Ngoai_Ngu, GDCD, Cong_Nghe FROM diem where ky='{semester}'"
    return execute_query(query)
