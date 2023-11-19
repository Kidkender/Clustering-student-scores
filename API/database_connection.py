# database_connection.py

import pyodbc

server = 'Acer'  # Thay 'ten_server' bằng tên máy chủ SQL Server của bạn
database = 'db_diemso'  # Thay 'QuanLyHocTap' bằng tên cơ sở dữ liệu của bạn
username = 'sa'
password = '1'

connection_string = f'DRIVER={{SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password}'
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
