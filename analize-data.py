import pandas as pd
from ydata_profiling import ProfileReport

df = pd.read_csv('SECOP_II_-_Procesos_de_Contrataci_n.csv')

Entidad =  df[['Entidad', 'Nit Entidad', 'Departamento Entidad', 'Ciudad Entidad', 'OrdenEntidad', 'Entidad Centralizada']]

EntidadPR = ProfileReport(Entidad, title = 'Entidad Profiling Report')
EntidadPR.to_file("EntidadPR.html")