import pandas as pd
import pyodbc
from sklearn.cluster import KMeans
import numpy as np
from process_database import connect_to_database, close_connection


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


def cluster_subject_in_semeter(data, n_clusters):
    data = np.array(data).reshape(-1, 1)

    kmeans = KMeans(n_clusters=n_clusters, n_init=10)

    kmeans.fit(data)

    labels = kmeans.labels_

    cluster_counts = [np.sum(labels == i) for i in range(n_clusters)]

    total_data_points = len(data)
    percentages = [count / total_data_points * 100 for count in cluster_counts]

    for i in range(n_clusters):
        print(
            f"Cụm {i + 1} có {cluster_counts[i]} phần tử ({percentages[i]:.2f}%)")

    cluster_centers = kmeans.cluster_centers_
    print("\nĐiểm trung bình của từng cụm:")
    for i, center in enumerate(cluster_centers):
        print(f"Cụm {i + 1}: {center[0]:.2f}")


def calculate_score_year(connection, subject, semester1, semester2):

    try:
        query1 = f"""
            SELECT
                MaHocSinh,
                ((SUM(CASE WHEN Ky = {semester1} THEN {subject} ELSE 0 END) + (SUM(CASE WHEN Ky = {semester2} 
                THEN {subject} ELSE 0 END) * 2)) / 3) AS Score_Avg
            FROM diem
            GROUP BY MaHocSinh
        """
        data = pd.read_sql_query(query1, connection)
        # print('data from query ',data)
        return data
    except pyodbc.Error as e:
        print(f"Error: {str(e)}")
        return None


def get_semester_grade(grade):
    if grade == '10':
        semester_1 = 1
        semester_2 = 2
        return semester_1, semester_2
    elif grade == '11':
        semester_1 = 3
        semester_2 = 4
        return semester_1, semester_2
    elif grade == '12':
        semester_1 = 5
        semester_2 = None
        return semester_1, semester_2


def get_data_grade(subject, grade):
    semester_1, semester_2 = get_semester_grade(grade)
    connection = connect_to_database()
    if connection:
        try:
            if grade == '12':
                data = query_score_from_database(
                    connection, subject, semester_1)
                return data[f'{subject}']
            else:
                data = calculate_score_year(
                    connection, subject, semester_1, semester_2)

                if data is not None:
                    print(
                        f"Dữ liệu môn {subject} từ bảng điểm tại khối {grade} :")
                    return data['Score_Avg']
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
                print(f"Dữ liệu tổng kêt của kỳ {semester}")
                return data['diemtongket']
        finally:
            close_connection(connection)
    else:
        print("Không thể kết nối đến cơ sở dữ liệu.")


def get_score_Avg_year(grade):
    semester_1, semester_2 = get_semester_grade(grade)
    connection = connect_to_database()
    if connection:
        try:

            data = query_score_Avg_Semester(connection, semester_2)
            if data is not None:
                print(f"Dữ liệu tổng kêt của năm học")
                return data['diemtongket']
        finally:
            close_connection(connection)
    else:
        print("Không thể kết nối đến cơ sở dữ liệu.")


def cluster_by_subject(data, n_clusters):
    data = np.array(data).reshape(-1, 1)

    kmeans = KMeans(n_clusters=n_clusters, n_init=10)

    kmeans.fit(data)

    labels = kmeans.labels_

    cluster_counts = [np.sum(labels == i) for i in range(n_clusters)]

    total_data_points = len(data)
    percentages = [count / total_data_points * 100 for count in cluster_counts]

    for i in range(n_clusters):
        print(
            f"Cụm {i + 1} có {cluster_counts[i]} phần tử ({percentages[i]:.2f}%)")

    cluster_centers = kmeans.cluster_centers_
    print("\nĐiểm trung bình của từng cụm:")
    for i, center in enumerate(cluster_centers):
        print(f"Cụm {i + 1}: {center[0]:.2f}")


if __name__ == "__main__":
    subject = input("Enter subject: ")
    grade = input("Enter grade: ")
    data_subject_year = get_data_grade(subject, grade)

    data = get_score_Avg_year('10')
    data1 = get_score_Avg_Semester('5')
    cluster_by_subject(data_subject_year, 5)
