import sys
sys.path.append("../")

from app.app import app
from app.helpers.mongoConnection import query
from bson import json_util
from flask import request

@app.route("/")
def root():
    return {"Welcome": "to datamad0121 API!!!"}

@app.route("/company")
def get_company():
    q = request.args
    print(q)
    return json_util.dumps(query(**q))


@app.route("/params/<x>/<y>") # Defining the endpoint
def params(x,y): # Positional arguments
    print(f"param1: {x}")
    print(f"param2: {y}")
    return {
        "param1":x,
        "param2":y
    }

@app.route("/sum/<x>/<y>") # Defining the endpoint
def suma(x,y): # Positional arguments
    return {"result":int(x)+int(y)}

@app.route("/sub/<x>/<y>") # Defining the endpoint
def sub(x,y): # Positional arguments
    return {"result":int(x)-int(y)}

@app.route("/query") # Defining the endpoint
def query_params():
    query = request.args
    return query

@app.route("/whoami")
def whoami():
    kwargs = request.args
    return f"Hola, soy {kwargs['name']}, tengo {kwargs['age']} años"

import os
@app.route("/hello")
def hello():
    os.popen("say Hello")
    return {}