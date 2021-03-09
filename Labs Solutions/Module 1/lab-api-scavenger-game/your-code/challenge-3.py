# enter your code below

# challenge-3.py


import json
import requests
import base64
import time

with open ('Token.txt', 'r') as f:
    acceso=str(f.readlines()[0]).split('=')

key=acceso[0].rstrip('\n')
user=acceso[1]

repo='ironhack-datalabs/scavenger'

#https://developer.github.com/v3/git/trees/#get-a-tree-recursively

#obtengo la lista de los archivos del repo type='blob'
get_blob='http://api.github.com/repos/{}/git/trees/master?recursive=1'.format(repo)

get_blob=requests.get(get_blob, auth=(user, key))
results_blob=get_blob.json()

#Buscamos los path de los archivos y su contenido
url_content='https://api.github.com/repos/ironhack-datalabs/scavenger/contents/'
tree=results_blob['tree']
archivos=[]
for i in range(len(tree)):
    if tree[i]['type']=='blob' and 'scavengerhunt' in tree[i]['path']:
        #obtengo el path y el contenido del archivo
        get_contenido=requests.get(url_content + tree[i]['path'])
        contenido=get_contenido.json()
        archivos.append((contenido['name'], contenido['content']))
        time.sleep(1)

#En el caso de que no me deje realizar muchas peticiones guardo en esta variable el resultado y dejo de ejecutar el codigo del bloque anterior
#archivos_temp=[('.0006.scavengerhunt', 'b2YK\n'), ('.0008.scavengerhunt', 'c3BlbnQK\n'), ('.0012.scavengerhunt', 'MjAK\n'), ('.0007.scavengerhunt', 'dGltZQo=\n'), ('.0021.scavengerhunt', 'bmVlZAo=\n'), ('.0022.scavengerhunt', 'dG8K\n'), ('.0005.scavengerhunt', 'cGVyY2VudAo=\n'), ('.0018.scavengerhunt', 'Y29tcGxhaW5pbmcK\n'), ('.0016.scavengerhunt', 'aXMK\n'), ('.0024.scavengerhunt', 'ZGF0YS4K\n'), ('.0010.scavengerhunt', 'cHJlcGFyaW5nCg==\n'), ('.0014.scavengerhunt', 'b2YK\n'), ('.0011.scavengerhunt', 'ZGF0YSwK\n'), ('.0023.scavengerhunt', 'cHJlcGFyZQo=\n'), ('.0020.scavengerhunt', 'dGhlCg==\n'), ('.0003.scavengerhunt', 'c2NpZW5jZSwK\n'), ('.0004.scavengerhunt', 'ODAK\n'), ('.0019.scavengerhunt', 'YWJvdXQK\n'), ('.0017.scavengerhunt', 'c3BlbnQK\n'), ('.0002.scavengerhunt', 'ZGF0YQo=\n'), ('.0013.scavengerhunt', 'cGVyY2VudAo=\n'), ('.0015.scavengerhunt', 'dGltZQo=\n'), ('.0009.scavengerhunt', 'aXMK\n'), ('.0001.scavengerhunt', 'SW4K\n')]
#archivos=archivos_temp

archivos.sort()
frase=''
for texto in archivos:
    frase+=str(base64.b64decode(texto[1]))

#La frase buscada es:
frase=frase.replace('b\'', '').replace('\\n\'', ' ')
print('La frase buscada es: ', frase) 



