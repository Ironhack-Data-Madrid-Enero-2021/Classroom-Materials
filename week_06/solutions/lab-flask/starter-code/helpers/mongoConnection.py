from pymongo import MongoClient

client = MongoClient()
db = client.hollywood

def insert(data,coll,database=db):
    """
    Function for inserting documents into a mongo collection.
    data -> document to be inserted
    coll -> string of collection name
    database -> database object, defaults to hollywoodapi
    """
    res = database[coll].insert_one(data)
    return res.inserted_id

def read(query,coll,database=db, project=None):
    """
    Function for reading documents of a mongo collection.
    query -> filter for mongo query
    coll -> string of collection name
    database -> database object, defaults to hollywoodapi
    """
    # If project=None, all attributes will be shown
    data = database[coll].find(query, project)
    return list(data)