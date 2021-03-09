#!/usr/bin/env python
# coding: utf-8

# ## Global Historical Climatology Network Dataset
# Variables are stored in both rows and columns
# This dataset represents the daily weather records for a weather station (MX17004) in Mexico for five months in 2010.

# In[1]:



import os                   # se importan librerias
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


# In[2]:


datos=pd.read_csv(os.path.join('../weather-raw.csv'))   # se cargan los datos
print (datos.head())


# In[3]:


#print (datos.info())          # informacion de no nulos
print (datos.describe())       # descripcion estadistica


# In[4]:


null=datos.isna().sum()       # se miran los valores nulos
null[null>0]


# In[5]:


# me quedo solo con los datos de los sensores y pongo a cero los NaN para bucle
 
datos=datos.fillna(0)
datos=datos.iloc[:,4::]   # todas las columnas desde la 5ª
datos=datos.transpose()
print (datos)            # ahora cada columna es t_max o t_min de cada mes, falta septiembre


# In[12]:


# extraigo los datos de temperatura

lista=[datos[c] for c in datos]                # lista de cada columna de los datos              
t_Max=[np.mean([e for e in lista[i] if e!=0]) for i in range(len(lista)) if i%2==0]  # temperatura maxima
t_min=[np.mean([e for e in lista[i] if e!=0]) for i in range(len(lista)) if i%2==1]  # temperatura minima

 # septiembre falta, hago la media de los meses adyacentes y luego las inserto en la lista
sep_M=(t_Max[7]+t_Max[8])/2
sep_m=(t_min[7]+t_min[8])/2
t_Max.insert(8, sep_M)
t_min.insert(8, sep_m)


# In[13]:

print (t_Max)
print (t_min)


# In[16]:


plt.plot([i for i in range(12)], t_Max, linestyle='-', marker='.',color = 'r')  # plot rojo temp Max
plt.plot([i for i in range(12)], t_min, linestyle='-', marker='.',color = 'b')  # plot azul temp min
plt.xlabel('Meses',size=13)
plt.ylabel('Temperatura',size=13)
plt.title('MX17004',size=14,fontweight='bold')
plt.savefig('temperaturas_MX17004.png', format='png')   # guarda imagen
plt.show()


# In[20]:


# construyo el dataframe completamente limpiado
Meses=['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre']

weather=pd.DataFrame(columns=Meses)
weather=weather.transpose()
weather['T_Max']=t_Max
weather['T_min']=t_min
weather.to_csv('weather.csv')  # se guarda el nuevo dataframe
print (weather)


# In[ ]:





# ## 
