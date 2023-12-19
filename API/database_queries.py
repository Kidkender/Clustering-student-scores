import pandas as pd
import pyodbc
from utils.subject_grade_utils import Last_Semester_Of_Grade, is_group_subject, get_semester_grade
from database_connection import connect_to_database, close_connection


def query_score_from_database(connection, subject, semester):
    try:
        query = f"SELECT {subject} FROM diem where ky='{semester}'"
        data = pd.read_sql_query(query, connection)
        return data
    except pyodbc.Error as e:
        print(f"Error: {str(e)}")
        return None


def get_score_subject_semester(subject, semester):
    connection = connect_to_database()
    if connection:
        try:
            data = query_score_from_database(connection, subject, semester)
            if data is not None:
                print(
                    f"Dữ liệu môn {subject} từ bảng điểm tại kỳ thứ : {semester}")
                return data
        finally:
            close_connection(connection)
    else:
        print("Không thể kết nối đến cơ sở dữ liệu.")


def calculate_score_year(connection, subject, semester1, semester2):
    try:
        query1 = f"""
            SELECT
                MaHocSinh,
                ((SUM(CASE WHEN Ky = {semester1} THEN {subject} ELSE 0 END) + 
                (SUM(CASE WHEN Ky = {semester2} THEN {subject} ELSE 0 END) * 2)) / 3) AS Score_Avg
            FROM diem
            GROUP BY MaHocSinh
        """
        data = pd.read_sql_query(query1, connection)
        return data
    except pyodbc.Error as e:
        print(f"Error: {str(e)}")
        return None


def get_data_grade(subject, grade):
    semester_1, semester_2 = get_semester_grade(grade)
    connection = connect_to_database()
    if connection:
        try:
            if grade == 12:
                data = query_score_from_database(
                    connection, subject, semester_1)
                return data[f'{subject}']
            else:
                data = calculate_score_year(
                    connection, subject, semester_1, semester_2)
                if data is not None:
                    print(
                        f"Dữ liệu môn {subject} từ bảng điểm tại khối {grade} :")
                    return data
        finally:
            close_connection(connection)
    else:
        print("Không thể kết nối đến cơ sở dữ liệu.")


def query_score_Avg_Semester(connection, semester):
    try:
        query = f"SELECT MaHocSinh,ky,diemtongket FROM Ketquadanhgia where ky='{semester}'"
        data = pd.read_sql_query(query, connection)
        return data
    except pyodbc.Error as e:
        print(f"Error: {str(e)}")
        return None


def get_score_Avg_Semester(semester):
    connection = connect_to_database()
    if connection:
        try:
            data = query_score_Avg_Semester(connection, semester)
            if data is not None:
                print(f"Dữ liệu tổng kết của kỳ {semester}")
                return data['diemtongket']
        finally:
            close_connection(connection)
    else:
        print("Không thể kết nối đến cơ sở dữ liệu.")


def get_score_Avg_year(grade):
    semester_1, semester_2 = get_semester_grade(grade)
    if grade == 12:
        semester_2 = semester_1
    connection = connect_to_database()
    if connection:
        try:
            data = query_score_Avg_Semester(connection, semester_2)
            if data is not None:
                print(f"Dữ liệu tổng kết của năm học")
                return data['diemtongket']
        finally:
            close_connection(connection)
    else:
        print("Không thể kết nối đến cơ sở dữ liệu.")


def query_Score_Group(connection, grade, subject_1, subject_2, subject_3):
    semester = Last_Semester_Of_Grade(grade)
    try:
        query = f"SELECT {subject_1},{subject_2},{subject_3}, mahocsinh FROM diem where ky='{semester}'"
        data = pd.read_sql_query(query, connection)
        return data
    except pyodbc.Error as e:
        print(f"Error: {str(e)}")
        return None


def get_Score_Group(group, grade):
    subjects = is_group_subject(group)
    if subjects is not None:
        subject_1, subject_2, subject_3 = subjects
    else:
        return "group subject invalid"
    connection = connect_to_database()
    if connection:
        try:

            data = query_Score_Group(
                connection, grade, subject_1, subject_2, subject_3)
            if data is not None:
                print(f"Điểm tổ hợp môn {group} tại kì 1 lớp 12 là: ")
                return data
        finally:
            close_connection(connection)
    else:
        print("Không thể kết nối đến cơ sở dữ liệu.")


def query_Top5_Subject_Avg(connection, student_code, semester):
    try:
        query_3 = f"""
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
                Select Ngoai_Ngu as value ,subject='Ngoai_Dgu' from diem where mahocsinh='{student_code}' and ky ={semester}
            ) as t
            order by value desc
        """

        data = pd.read_sql_query(query_3, connection)
        return data
    except pyodbc.Error as e:
        print(f"Error: {str(e)}")
        return None


def get_Subject_From_Top5Avg(grade, student_code):
    semester = Last_Semester_Of_Grade(grade)
    connection = connect_to_database()
    if connection:
        try:
            data = query_Top5_Subject_Avg(connection, student_code, semester)
            if data is not None:
                print(
                    f"Top 5 môn có điểm trung  bình cao nhất tại khối {grade} của học sinh")
                return data
        finally:
            close_connection(connection)
    else:
        print("Không thể kết nối đến cơ sở dữ liệu.")


def Query_Students(connection):
    try:
        query = f"Select * from hocsinh"
        data = pd.read_sql_query(query, connection)
        return data
    except pyodbc.Error as e:
        print(f"Error: {str(e)}")
        return None


def get_students():
    connection = connect_to_database()
    if connection:
        try:
            data = Query_Students(connection)
            if data is not None:
                return data
        finally:
            close_connection(connection)
    else:
        print("Không thể kết nối đến cơ sở dữ liệu.")


def Query_Score_Students(connection):
    try:
        query = f"Select * from hocsinh h, diem d where h.MaHocSinh = d.MaHocSinh"
        data = pd.read_sql_query(query, connection)
        return data
    except pyodbc.Error as e:
        print(f"Error: {str(e)}")
        return None


def get_score_students():
    connection = connect_to_database()
    if connection:
        try:
            data = Query_Score_Students(connection)
            if data is not None:
                return data
        finally:
            close_connection(connection)
    else:
        print("Không thể kết nối đến cơ sở dữ liệu.")


def Query_RateResult(connection):
    try:
        query = f"Select * from hocsinh h, KetQuaDanhGia k where h.MaHocSinh = k.MaHocSinh"
        data = pd.read_sql_query(query, connection)
        return data
    except pyodbc.Error as e:
        print(f"Error: {str(e)}")
        return None


def get_RateResult():
    connection = connect_to_database()
    if connection:
        try:
            data = Query_RateResult(connection)
            if data is not None:
                return data
        finally:
            close_connection(connection)
    else:
        print("Không thể kết nối đến cơ sở dữ liệu.")


def Query_Students_byId(connection, id):
    try:
        query = f"Select * from hocsinh h where h.MaHocSinh = {id}"
        data = pd.read_sql_query(query, connection)
        return data
    except pyodbc.Error as e:
        print(f"Error: {str(e)}")
        return None


def get_student_by_id(id):
    connection = connect_to_database()
    if connection:
        try:
            data = Query_Students_byId(connection, id)
            if data is not None:
                return data
        finally:
            close_connection(connection)
    else:
        print("Không thể kết nối đến cơ sở dữ liệu.")


def Query_Score_by_student_id(connection, id):
    try:
        query = f"Select * from  diem d where d.MaHocSinh = {id}"
        data = pd.read_sql_query(query, connection)
        return data
    except pyodbc.Error as e:
        print(f"Error: {str(e)}")
        return None


def get_score_by_student_id(id):
    connection = connect_to_database()
    if connection:
        try:
            data = Query_Score_by_student_id(connection, id)
            if data is not None:
                return data
        finally:
            close_connection(connection)
    else:
        print("Không thể kết nối đến cơ sở dữ liệu.")


"""_summary_Get Rate result by student id
"""


def Query_rate_by_student_id(connection, id):
    try:
        query = f"Select * from KetQuaDanhGia k where k.MaHocSinh = {id}"
        data = pd.read_sql_query(query, connection)
        return data
    except pyodbc.Error as e:
        print(f"Error: {str(e)}")
        return None


def get_rate_by_student_id(id):
    connection = connect_to_database()
    if connection:
        try:
            data = Query_rate_by_student_id(connection, id)
            if data is not None:
                return data
        finally:
            close_connection(connection)
    else:
        print("Không thể kết nối đến cơ sở dữ liệu.")
