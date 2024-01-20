import credentials as cd
import pandas as pd
import pyodbc
import uuid

def connectBD():
     try:
          cnxn = pyodbc.connect('DRIVER={SQL Server};SERVER='+cd.server+';DATABASE='+cd.database+';UID='+cd.username+';PWD='+ cd.password)
          return cnxn
     except Exception as e:
          print(f'Error al conectar con la base de datos. {e}')
          return None

def insertData(df):
     try:
          cxn = connectBD()
          cursor = cxn.cursor()
          for i, row in df.iterrows():
               cursor.execute("INSERT INTO Entidad VALUES(?,?,?,?,?,?)",
                               row.idEntidad
                               ,row['Nit Entidad']
                               ,row.Entidad
                               ,row['Departamento Entidad']
                               ,row['Ciudad Entidad']
                               ,row['OrdenEntidad']
                               ,row['Entidad Centralizada'])
          cursor.commit()
          print(f"Se insertaron {len(df)} registros de forma correcta")
     except Exception as e:
          print(f'Error al insertar en la base de datos. {e}')
     finally:
          cursor.close()
          cxn.close()

df = pd.read_csv('SECOP_II_-_Procesos_de_Contrataci_n.csv') # ! Debido a que tenemos que sacar los datos desde la fuente, nos vemos obligados a tomar todo el archivo, aunque solo necesitemos ciertas columnas

df =  df[['Entidad', 'Nit Entidad', 'Departamento Entidad', 'Ciudad Entidad', 'OrdenEntidad', 'Entidad Centralizada']] # * Tomamos solo las columnas de la entidad

df = df.drop_duplicates() # * Se toman los registros únicos.

df['idEntidad'] = uuid.uuid4() # * Se crea la columna del uniqueidentifier para su inserción sobre la base de datos.

df['Entidad Centralizada'] = df['Entidad Centralizada'].replace('Si', True)
df['Entidad Centralizada'] = df['Entidad Centralizada'].replace('No', False)

insertData(df)