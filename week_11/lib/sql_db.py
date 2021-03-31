from sqlalchemy import create_engine, Column, Float, Integer, JSON, DateTime, Text
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import DDL

import pandas as pd




class ToSQL:
    
    def __init__(self, str_conn, schema, Table):
        self.schema=schema
        self.Table=Table
        self.motor=create_engine(str_conn)
        self.sesion=sessionmaker(bind=self.motor)()


    
    def crea_tablas(self):
        if not self.motor.dialect.has_table(self.motor, self.Table.__tablename__, schema=self.schema):
            print('Creando tabla...')
            self.Table.__table__.create(self.motor)
        else:
            print('Tabla ya existe.')
        
        
    def rellena_tablas(self, datos):   # datos es un dataframe de pandas

        if type(datos)!=pd.core.frame.DataFrame:
            raise TypeError('No es un dataframe alegre...')

        
        for e in datos.to_dict(orient='records'):
            
            item=self.Table(**e)

            self.sesion.add(item)
            
        self.sesion.commit()
        print('Comiteado')
        
        
    def borra_tablas(self):
        if self.motor.dialect.has_table(self.motor, self.Table.__tablename__, schema=self.schema):
            print('Borrando tabla...')
            self.Table.__table__.drop(self.motor)
            
            
    def show_df(self):
        data=self.motor.execute(DDL(f'select * from {self.schema}.{self.Table.__tablename__}')).fetchall()
        columns=self.motor.execute(DDL(f"select * from {self.schema}.information_schema.columns where table_name='{self.Table.__tablename__}'")).fetchall()
        return pd.DataFrame(data, columns=[e[3] for e in columns])
