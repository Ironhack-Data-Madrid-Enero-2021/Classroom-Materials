from flask import Flask, request
from helpers.mongoConnection import read, insert
from bson import json_util, ObjectId
from helpers.checking import check_mandatory

app = Flask("hollywoodapi")

@app.route("/celebrities")
def celebrities():
    # An empty dictionary as query will return all documents in collection
    data = read({},"celebrities", project={"name":1})
    # Because our data contains ObjectId's, that are not automatically converted to 
    # data types compatible with json, we use `json_util.dumps` to do so.
    return json_util.dumps(data)

# To fetch argument from endpoint, enclose in < > and add to function signature
@app.route("/celebrities/details/<celebrity_id>")
def celebrities_details(celebrity_id):
    try:
        id_ = ObjectId(celebrity_id)
    except:
        # Returning an int after json response will set it to the HTTP response code
        # Default is 200 OK.
        return {"Error":"celebrity_id not valid!"},400
        # Error code 400 means Bad Request.
    q = {"_id":id_}
    data = read(q,"celebrities")
    if len(data) == 0:
        return {"Error":"No celebrity with given id!"}
    return json_util.dumps(data)

@app.route("/celebrities/new")
def celebrities_new():
    # All the query parameters (The parameters following the ? on the url or the params in `requests.get`)
    # are recognized by flask on a dictionary and stored in `request.args`
    # This, however, is an InmutableDictionary object. We convert it to a regular dictionary.
    args = dict(request.args)
    # Checking if all necessary parameters were given
    if not check_mandatory(args,["name", "occupation", "catch_phrase"]):
        return {"Error":"missing obligatory parameter"}
    
    q = {"name":args["name"]}
    # We try to find a celebrity with the same name
    data = read(q,"celebrities")
    # If there is any response, data will contain an element
    if len(data)>0:
        return {"Error":"Celebrity already exists"}
    res = insert(args,"celebrities")
    return json_util.dumps({"_id":res})

app.run(debug=True)