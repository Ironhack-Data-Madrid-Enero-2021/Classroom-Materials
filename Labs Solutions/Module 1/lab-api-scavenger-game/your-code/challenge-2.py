# enter your code below

# challenge-2.py


import json
import requests

with open ('Token.txt', 'r') as f:
    acceso=str(f.readlines()[0]).split('=')

key=acceso[0].rstrip('\n')
user=acceso[1]

repo='ironhack-datalabs/datamad0419'
desde='2019-04-15T00:00:00Z'
hasta='2019-04-21T23:59:59Z'

get_commits='http://api.github.com/repos/{}/commits?since={}&until={}'.format(repo, desde, hasta)

res_commit=requests.get(get_commits, auth=(user, key))
results_commit=res_commit.json()

commits=[]
for i in range(len(results_commit)):
    commits.append(results_commit[i]['committer'])

print(len(commits)) 
			

	
