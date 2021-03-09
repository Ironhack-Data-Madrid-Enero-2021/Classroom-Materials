#!/usr/bin/env python
# coding: utf-8

# #### 1. Import pandas library

# In[1]:


import pandas as pd


# #### 2. Import pymysql and sqlalchemy as you have learnt in the lesson of importing/exporting data 
# 

# In[2]:


from sqlalchemy import create_engine
import pymysql as mdb


# #### 3. Create a mysql engine to set the connection to the server. Check the connection details in [this link](https://relational.fit.cvut.cz/search?tableCount%5B%5D=0-10&tableCount%5B%5D=10-30&dataType%5B%5D=Numeric&databaseSize%5B%5D=KB&databaseSize%5B%5D=MB)

# In[3]:



motor=create_engine('mysql+mysqlconnector://guest:relational@relational.fit.cvut.cz:3306/stats')


# #### 4. Import the users table 

# In[4]:


users_table=pd.read_sql('SELECT Id FROM users', motor)
print (users_table.head())


# #### 5. Rename Id column to userId

# In[5]:


users_table=users_table.rename(columns={'Id': 'userId'})
print (users_table.head())


# #### 6. Import the posts table. 

# In[6]:


posts_table=pd.read_sql('SELECT Id,OwnerUserId FROM posts', motor)
print (posts_table.head())


# #### 7. Rename Id column to postId and OwnerUserId to userId

# In[7]:


posts_table=posts_table.rename(columns={'Id': 'postId', 'OwnerUserId': 'userId'})
print (posts_table.head())


# #### 8. Define new dataframes for users and posts with the following selected columns:
#     **users columns**: userId, Reputation,Views,UpVotes,DownVotes
#     **posts columns**: postId, Score,userID,ViewCount,CommentCount

# In[8]:


users=pd.read_sql('SELECT Id,Reputation,Views,UpVotes,DownVotes FROM users', motor)
posts=pd.read_sql('SELECT Id,Score,ViewCount,CommentCount,OwnerUserId FROM posts', motor)

users=users.rename(columns={'Id': 'userId'})
print (users.head())
posts=posts.rename(columns={'Id': 'postId', 'OwnerUserId': 'userId'})
print (posts.head())


# #### 8. Merge both dataframes, users and posts. 
# You will need to make a [merge](https://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.merge.html) of posts and users dataframes.

# In[9]:


datos=pd.merge(users, posts, on='userId')
print (datos.head(10))


# #### 9. How many missing values do you have in your merged dataframe? On which columns?

# In[10]:


null=datos.isna().sum()     # tambien vale datos.isnull().sum() 
print (null[null>0])


# #### 10. You will need to make something with missing values.  Will you clean or filling them? Explain. 
# **Remember** to check the results of your code before passing to the next step

# In[11]:


# relleno a cero porque el numero de visitas es significativo, por ejemplo para la monetizacion y no quiero eliminar la 
# mitad de los datos, podrian ser tambien significativos, como el score o reputation.

datos['ViewCount']=datos['ViewCount'].fillna(0)
print (datos.describe())


# #### 11. Adjust the data types in order to avoid future issues. Which ones should be changed? 

# In[12]:



datos['ViewCount']=datos['ViewCount'].astype('int64')
print (datos.dtypes)
# el numero de visitas es siempre un numero entero, no tiene sentido el float


# In[31]:


# Bonus
import numpy as np

columnas=datos.columns.values.tolist()

stats=datos.describe().transpose()
stats['IQR']=stats['75%']-stats['25%']
#display(stats)

outliers=pd.DataFrame(columns=columnas)

for c in stats.index:
    iqr=stats.at[c,'IQR']
    corte=iqr*1.5
    low=stats.at[c,'25%']-corte
    up=stats.at[c,'75%']+corte
    res=datos[(datos[c]<low) | (datos[c]>up)].copy()
    res['Outlier']=c
    outliers=outliers.append(res)


print(outliers)
outliers.to_csv('outliers.csv')


# #### Bonus: Identify extreme values in your merged dataframe as you have learned in class, create a dataframe called outliers with the same columns as our data set and calculate the bounds. The values of the outliers dataframe will be the values of the merged_df that fall outside that bounds. You will need to save your outliers dataframe to a csv file on your-code folder.
