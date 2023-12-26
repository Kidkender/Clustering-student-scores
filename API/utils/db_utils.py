import pyodbc
import pandas as pd
from errors.error_exception import DatabaseConnectionError

server = 'Acer'
database = 'db_diemso'
username = 'sa'
password = '12'

connection_string = f'DRIVER={{SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password}'
sheet_names = ['1', '2', '3', '4', '5']


def connect_to_database():
    try:
        connection = pyodbc.connect(connection_string)
        return connection
    except pyodbc.Error as e:
        raise DatabaseConnectionError()


def close_connection(connection):
    if connection:
        connection.close()


def query_database(connection, query):
    try:
        data = pd.read_sql_query(query, connection)
        return data
    except pyodbc.Error as e:
        print(f"Error: {str(e)}")
        return None
