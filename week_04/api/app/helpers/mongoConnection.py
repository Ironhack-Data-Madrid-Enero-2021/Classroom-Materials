from pymongo import MongoClient

client = MongoClient()

def cast_type(dic):
    types = {
        str : ["name"],
        int : ["founded_year", "number_of_employees"]
    }
    for k,v in dic.items():
        for typ, lst in types.items():
            if k in lst:
                dic[k] = typ(v)
                break
    return dic
    

def query(**kwargs):
    """
    for k,v in kwargs.items():
        if k == "name":
            kwargs[k] = str(v)
        if k == "founded_year":
            kwargs[k] = int(v)
    """
    print(kwargs)
    kwargs = cast_type(kwargs)
    print(kwargs)
    res = client.companies.companies.find(kwargs,{"name":1,"offices":1})
    return list(res)