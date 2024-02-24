import pyodbc
import credentials as cd

def connectBD():
     try:
          cnxn = pyodbc.connect('DRIVER={ODBC Driver 18 for SQL Server};SERVER='+cd.server+';DATABASE='+cd.database+';UID='+cd.username+';PWD='+ cd.password+';Authentication=SqlPassword;TrustServerCertificate=Yes')
          print("Se ha conectado de forma exitosa con la base de datos")
          return cnxn
     except Exception as e:
          print(f'Error al conectar con la base de datos. {e}')
          return None