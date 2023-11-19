import pandas as pd
import pyodbc

# Kết nối đến cơ sở dữ liệu SQL Server
server = 'Acer'  # Thay 'ten_server' bằng tên máy chủ SQL Server của bạn
database = 'db_diemso'  # Thay 'QuanLyHocTap' bằng tên cơ sở dữ liệu của bạn
username = 'sa'
password = '1'

connection_string = f'DRIVER={{SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password}'

# excel_file = 'bangdiem.xlsx'
# sheet_names = pd.ExcelFile(excel_file).sheet_names
# df = pd.read_excel(excel_file)

sheet_names = ['1', '2', '3', '4', '5']


def connect_to_database():
    try:
        connection = pyodbc.connect(connection_string)
        return connection
    except pyodbc.Error as e:
        print(f"Error: {str(e)}")
        return None


def close_connection(connection):
    if connection:
        connection.close()


def get_total_students():
    conn = connect_to_database()
    if conn:
        try:
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM hocsinh")
            result = cursor.fetchall()
            total_students = len(result)
            return total_students
        except pyodbc.Error as e:
            print(f"Error: {str(e)}")
        finally:
            close_connection(conn)


def insert_students_from_excel(excel_file):
    conn = connect_to_database()
    if conn:
        try:
            cursor = conn.cursor()

            for sheet_name in sheet_names:
                df = pd.read_excel(excel_file, sheet_name=sheet_name)

                for index, row in df.iterrows():
                    cursor.execute(
                        """
                        INSERT INTO hocsinh (MaHocSinh, TenHocSinh)
                        SELECT ?, ?
                        WHERE NOT EXISTS (SELECT 1 FROM hocsinh WHERE MaHocSinh = ?)
                        """, row['Mã học sinh'], row['Họ và tên'], row['Mã học sinh']
                    )

            conn.commit()
            print("insert successfully")
        except pyodbc.Error as e:
            print(f"Error: {str(e)}")
        finally:
            close_connection(conn)


def Column_all_sheets():
    for sheet_name in sheet_names:
        df = pd.read_excel(excel_file, sheet_name=sheet_name)
        df['Ky'] = int(sheet_name)  # Chỉ định kỳ dựa trên tên sheet

        print("Danh sách các cột trong sheet", sheet_name, ":", df.columns)


def insert_scores_from_excel(excel_file):
    conn = connect_to_database()
    if conn:
        try:
            cursor = conn.cursor()

            for sheet_name in sheet_names:
                df = pd.read_excel(excel_file, sheet_name=sheet_name)
                df['Ky'] = int(sheet_name)

                for index, row in df.iterrows():
                    cursor.execute(
                        """
                        INSERT INTO diem (MaHocSinh, Ky, Toan, Li, Hoa, Sinh, Van, Su, Dia, Ngu_Ngu, GDCD, Cong_Nghe)
                        SELECT ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?
                        WHERE NOT EXISTS (SELECT 1 FROM diem WHERE MaHocSinh = ? AND Ky = ?)
                        """,
                        (row['Mã học sinh'], row['Ky'], row['Toán'], row['Lí'], row['Hóa'], row['Sinh'], row['Văn'], row['Sử'],
                         row['Địa'], row['Ng.ngữ'], row['GDCD'], row['C.nghệ'], row['Mã học sinh'], row['Ky'])
                    )

            conn.commit()
            print('Insert score sucessfully')
        except pyodbc.Error as e:
            print(f"Error: {str(e)}")
        finally:
            close_connection(conn)


def results_of_the_period(excel_file):
    conn = connect_to_database()
    if conn:
        try:
            cursor = conn.cursor()

            for sheet_name in sheet_names:
                df = pd.read_excel(excel_file, sheet_name=sheet_name)
                df['Ky'] = int(sheet_name)

                for index, row in df.iterrows():
                    cursor.execute(
                        """
                       INSERT INTO KetQuaDanhGia (MaHocSinh, Ky,DiemTongKet, HocLuc, HanhKiem)
                        SELECT ?, ?, ?, ?,?
                        WHERE NOT EXISTS (SELECT 1 FROM KetquaDanhgia WHERE MaHocSinh = ? AND Ky = ?)
                        """,
                        (row['Mã học sinh'], row['Ky'], row['Điểm TK'], row['Học lực'],
                         row['Hạnh kiểm'], row['Mã học sinh'], row['Ky'])

                    )

            conn.commit()
            print('Insert scores into KetQuaDanhGia successfully')

        except pyodbc.Error as e:
            print(f"Error: {str(e)}")
        finally:
            close_connection(conn)


if __name__ == "__main__":
    excel_file = 'bangdiem.xlsx'
    results_of_the_period(excel_file)
    # total_students=get_total_students()
    # print("Total students ",total_students)
    # insert_students_from_excel(excel_file)
    # Column_all_sheets()
    # insert_scores_from_excel(excel_file)
