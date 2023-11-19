import pandas as pd
import pyodbc
from sklearn.cluster import KMeans
import numpy as np
from process_database import connect_to_database,close_connection



def query_score_from_database(connection,subject,semester):
    try:
        # Thực hiện truy vấn SQL để lấy dữ liệu từ bảng hocsinh
        query = f"SELECT {subject} FROM diem where ky='{semester}'"
        data = pd.read_sql_query(query, connection)
        return data
    except pyodbc.Error as e:
        print(f"Error: {str(e)}")
        return None

# Kết nối đến cơ sở dữ liệu

def get_score_subject_semester( subject,semester):
    connection = connect_to_database()
    if connection:
        try:
            # Lấy dữ liệu từ bảng hocsinh và hiển thị bằng Pandas
            # table_name = 'hocsinh'
            data = query_score_from_database(connection, subject,semester)
            if data is not None:
                print(f"Dữ liệu môn {subject} từ bảng điểm tại kỳ thứ : {semester}")
                # print(data)
                return data
        finally:
            # Đóng kết nối đến cơ sở dữ liệu sau khi hoàn thành
            close_connection(connection)
    else:
        print("Không thể kết nối đến cơ sở dữ liệu.")

def cluster_subject_in_semeter(data,n_clusters):
    data = np.array(data).reshape(-1, 1)

    # Tạo mô hình K-means
    kmeans = KMeans(n_clusters=n_clusters,n_init=10)

    # Phân cụm dữ liệu
    kmeans.fit(data)

    # Lấy nhãn của từng điểm dữ liệu
    labels = kmeans.labels_

    # Tính số phần tử trong mỗi cụm
    cluster_counts = [np.sum(labels == i) for i in range(n_clusters)]

    # Tính tỷ lệ phần trăm cho mỗi cụm
    total_data_points = len(data)
    percentages = [count / total_data_points * 100 for count in cluster_counts]

    # In kết quả
    for i in range(n_clusters):
        print(f"Cụm {i + 1} có {cluster_counts[i]} phần tử ({percentages[i]:.2f}%)")

    # Điểm trung bình của từng cụm
    cluster_centers = kmeans.cluster_centers_
    print("\nĐiểm trung bình của từng cụm:")
    for i, center in enumerate(cluster_centers):
        print(f"Cụm {i + 1}: {center[0]:.2f}")


def calculate_score_year(connection,subject,semester1,semester2):

    try:
        # Thực hiện truy vấn SQL để lấy dữ liệu từ bảng hocsinh
        # query = f"SELECT {subject},mahocsinh FROM diem where ky='{semester}'"
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
    if grade =='10':
        semester_1=1
        semester_2=2
        return semester_1,semester_2
    elif grade =='11':
        semester_1=3
        semester_2=4
        return semester_1,semester_2
    elif grade =='12':
        semester_1=5
        semester_2=None
        return semester_1,semester_2

def get_data_grade( subject,grade):
    semester_1,semester_2=get_semester_grade(grade)
    connection = connect_to_database()
    if connection:
        try:
            if grade =='12':
                data=query_score_from_database(connection,subject,semester_1)
                # print(data[f'{subject}'])
                return data[f'{subject}']
            else:
                # Lấy dữ liệu từ bảng hocsinh và hiển thị bằng Pandas
                # table_name = 'hocsinh'
                data=calculate_score_year(connection,subject,semester_1,semester_2)
             
                if data is not None:
                    print(f"Dữ liệu môn {subject} từ bảng điểm tại khối {grade} :")
                    # print(data)
                    return data['Score_Avg']
        finally:
            # Đóng kết nối đến cơ sở dữ liệu sau khi hoàn thành
            close_connection(connection)
    else:
        print("Không thể kết nối đến cơ sở dữ liệu.")

##   AVG Semester - year 

def query_score_Avg_Semester(connection,semester):
    try:
        query = f"SELECT MaHocSinh,ky,diemtongket FROM Ketquadanhgia where ky='{semester}'"
        data = pd.read_sql_query(query, connection)
        return data
    except pyodbc.Error as e:
        print(f"Error: {str(e)}")
        return None

def get_score_Avg_Semester( semester):
    connection = connect_to_database()
    if connection:
        try:
            # Lấy dữ liệu từ bảng hocsinh và hiển thị bằng Pandas
            # table_name = 'hocsinh'
            data = query_score_Avg_Semester(connection,semester)
            if data is not None:
                print(f"Dữ liệu tổng kêt của kỳ {semester}")
                # print(data)
                return data['diemtongket']
        finally:
            # Đóng kết nối đến cơ sở dữ liệu sau khi hoàn thành
            close_connection(connection)
    else:
        print("Không thể kết nối đến cơ sở dữ liệu.")

def get_score_Avg_year( grade):
    semester_1,semester_2=get_semester_grade(grade)
    connection = connect_to_database()
    if connection:
        try:
            # Lấy dữ liệu từ bảng hocsinh và hiển thị bằng Pandas
            # table_name = 'hocsinh'
            data = query_score_Avg_Semester(connection,semester_2)
            if data is not None:
                print(f"Dữ liệu tổng kêt của năm học")
                # print(data)
                return data['diemtongket']
        finally:
            # Đóng kết nối đến cơ sở dữ liệu sau khi hoàn thành
            close_connection(connection)
    else:
        print("Không thể kết nối đến cơ sở dữ liệu.")



def cluster_by_subject(data,n_clusters):
    data = np.array(data).reshape(-1, 1)

    # Tạo mô hình K-means
    kmeans = KMeans(n_clusters=n_clusters,n_init=10)

    # Phân cụm dữ liệu
    kmeans.fit(data)

    # Lấy nhãn của từng điểm dữ liệu
    labels = kmeans.labels_

    # Tính số phần tử trong mỗi cụm
    cluster_counts = [np.sum(labels == i) for i in range(n_clusters)]

    # Tính tỷ lệ phần trăm cho mỗi cụm
    total_data_points = len(data)
    percentages = [count / total_data_points * 100 for count in cluster_counts]

    # In kết quả
    for i in range(n_clusters):
        print(f"Cụm {i + 1} có {cluster_counts[i]} phần tử ({percentages[i]:.2f}%)")

    # Điểm trung bình của từng cụm
    cluster_centers = kmeans.cluster_centers_
    print("\nĐiểm trung bình của từng cụm:")
    for i, center in enumerate(cluster_centers):
        print(f"Cụm {i + 1}: {center[0]:.2f}")

if __name__ == "__main__":
    subject=input("Enter subject: ")
    # semester=input("Enter semester: ")
    grade=input("Enter grade: ")
    data_subject_year= get_data_grade(subject,grade)

    # data_subject_year= get_data_grade('toan','12')
    # data_subject_semester=get_score_subject_semester(subject,semester)
    # print("length data ",data_subject_year)
    data=get_score_Avg_year('10')
    data1=get_score_Avg_Semester('5')
    cluster_by_subject(data_subject_year,5)
    # data=get_data(subject,semester)
    # cluster_subject_in_semeter(data,5)