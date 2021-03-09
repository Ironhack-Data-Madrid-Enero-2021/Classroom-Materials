![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# MongoDB | Compass CRUD


## 1. Installation

### 1.1. Installation Mongo

Link: https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/

1. Execute in terminal one by one the following commands. 
```
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections
```

2. Check if works.
```
sudo service mongod start
```
3. Check the log, we should see something like **[initandlisten] waiting for connections on port 27017**
```
sudo cat /var/log/mongodb/mongod.log
```
4. Reset service.
```
sudo service mongod stop
```
5. Reboot service to keep it working.
```
sudo service mongod restart
mongo
```

### 1.2. Installation Compass
Link: https://docs.mongodb.com/compass/master/install/

1. Download from link: https://www.mongodb.com/download-center/compass?jmp=hero
2. Execute the downloaded file.
3. Now you've got mongodb-compass.


## 2. Import database to mongodb
1. Start mongodb 
```
sudo service mongod restart
```
2. Open compass 
3. Create database (green button) and select the Database fields name: db_companies, Collection name: companies. 
![](images/01-create-database.png)
![](images/02-create-database.png)
![](images/03-compass-mongo-companies.png)

4. Import json file to mongo: 
```
mongoimport --db db_companies --collection companies companies.json
```

## 3. pymongo and filtered out

### 3.1 requirements
```
pip3 install pymongo
```

Now open jupyter notebook
```
jupyter notebook
```

### 3.2 Connection to the database

```Python
# imports
from pymongo import MongoClient
import pandas as pd

# connection with mongo
client = MongoClient("mongodb://localhost:27017/")

# connection with database "db_companies"
db = client.db_companies

# companies collection
collection_companies = db.companies

# querying EVERYTHING
query = collection_companies.find()

# convert to pandas.DataFrame
df = pd.DataFrame(query)
```




## Introduction Lab

We are back with our queries! :wink:

We have learned some super useful query operators, that will helps us to make much better queries to retrieve the data we need. We will continue using the **Crunchbase** database we used on the last exercise.



## Submission

- Upon completion, run the following commands
```
$ git add .
$ git commit -m "done"
$ git push origin master
```
- Create Pull Request so your TAs can check up your work.


## Deliverables

Since we will be querying our database from Mongo Compass, you will need to copy/paste the `query`, `projection`, `sort`, `skip` and `limit` you entered on Mongo Compass. In the `queries.md` file, you will find the instructions about the queries you need to do, and a field to fill the answers.

### Example

1. This is an example
 - **`query`**: /*You should copy/paste the query in here*/
 - **`projection`**: /*You should copy/paste the projection in here*/
 - **`sort`**: /*You should copy/paste the sort in here*/
 - **`skip`**: /*You should copy/paste the skip in here*/
 - **`limit`**: /*You should copy/paste the limit in here*/

## Instructions

### Iteration 1

First, we need to import the database we will be using for the `lab`. We will use the Crunchbase database. Crunchbase is the premier destination for discovering industry trends, investments, and news about hundreds of thousands of companies globally. From startups to Fortune 500s, Crunchbase is recognized as the primary source of company intelligence by millions of users globally.

The database contains more than 18k documents, and each of them has a lot of information about each of the companies. A document looks like the following:

![image](https://user-images.githubusercontent.com/23629340/36494916-d6db1770-1733-11e8-903e-5119b3c1b688.png)

1. You will find the `.zip` file of the Database on the **lab** folder.
2. Unzip the file
3. From the terminal, import the database to Mongo using the following command:
```bash
$ mongoimport --db companies --collection companies --file companies.json
```
4. Check on Mongo Compass if everything goes ok:

:::info >
When running the `mongoimport` you should be located in the same folder as the `companies.json` file.
:::

![image](https://user-images.githubusercontent.com/23629340/36534191-1f1bc5ec-17c6-11e8-9463-4945679b98c0.png)


### Iteration 2

You already know how this goes, so let's start working:

1. All the companies that it's name match 'Babelgum'. Retrieve only their `name` field.
2. All the companies that have more than 5000 employees. Limit the search to 20 companies and sort them by **number of employees**.
3. All the companies founded between 2000 and 2005, both years included. Retrieve only the `name` and `founded_year` fileds.
4. All the companies that had a Valuation Amount of more than 100.000.000 and have been founded before 2010. Retrieve only the `name` and `ipo` fields.
5. All the companies that have less than 1000 employees and have been founded before 2005. Order them by the number of employees and limit the search to 10 companies.
6. All the companies that don't include the `partners` field.
7. All the companies that have a null type of value on the `category_code` field.
8. All the companies that have at least 100 employees but less than 1000. Retrieve only the `name` and `number of employees` fields.
9. Order all the companies by their IPO price descendently.
10. Retrieve the 10 companies with more employees, order by the `number of employees`
11. All the companies founded on the second semester of the year. Limit your search to 1000 companies.
12. All the companies that have been 'deadpooled' after the third year.
13. All the companies founded before 2000 that have and acquisition amount of more than 10.000.000
14. All the companies that have been acquired after 2015, order by the acquisition amount, and retrieve only their `name` and `acquisiton` field.
15. Order the companies by their `founded year`, retrieving only their `name` and `founded year`.
16. All the companies that have been founded on the first seven days of the month, including the seventh. Sort them by their `aquisition price` descendently. Limit the search to 10 documents.
17. All the companies on the 'web' `category` that have more than 4000 employees. Sort them by the amount of employees in ascendant order.
18. All the companies which their acquisition amount is more than 10.000.000, and currency are 'EUR'.
19. All the companies that have been acquired on the first trimester of the year. Limit the search to 10 companies, and retrieve only their `name` and `acquisition` fields.
20. All the companies that have been founded between 2000 and 2010, but have not been acquired before 2011.


Happy Coding! :heart:
