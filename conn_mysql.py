import mysql.connector #https://www.youtube.com/watch?v=mFEQS8mRovM
from mysql.connector import Error

def conexion_BD(query):

    try:
        conexion = mysql.connector.connect(
            host='localhost', 
            port=3306, 
            user='Henry',
            password='password123', 
            db='pi01_data03'
        )
        if conexion.is_connected():
            #print('Conexión exitosa')
            cursor=conexion.cursor()
            cursor.execute(query)
            registro=cursor.fetchone()              #fetch: ir a buscar
            #print('Conectado a la BD: ', registro)
    except Error as ex:
        pass
        #print('Error durante la conexión:', ex)
    finally:
        if conexion.is_connected():
            conexion.close()        #Se cerró la conexión a la BD
            #print('La conexión ha finalizado')
    return registro