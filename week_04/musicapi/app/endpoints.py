import sys
sys.path.append("../")

from app.app import app
from flask import request
from bson import json_util
from app.src.mongoConnection import insert_user, insert_song, fetch_songs
from random import choice

"""
/user/create
- parameters: name, username
- Creates an user on database
"""
def is_valid(input,keywords):
    for key in keywords:
        if key not in input.keys():
            return False, {"Fail":f"Must pass {key}"}
    return True, "OK"

@app.route("/user/create")
def create_user():
    user = request.args
    check, msg = is_valid(user,["name","username"])
    if not check:
        return msg
    id_ = insert_user(**user)
    return json_util.dumps(id_)

"""
/music/add
- parameters: username, song_title, song_url
- Adds Song to songs collection
"""

@app.route("/music/add")
def add_song():
    song = request.args
    check, msg = is_valid(song,["username", "song_title", "song_url"])
    if not check:
        return msg
    id_ = insert_song(**song)
    return json_util.dumps(id_)


"""
#### /music/random
- parameters: None
- Return a random song url
"""
@app.route("/music/random")
def random_song():
    songs = fetch_songs()
    return json_util.dumps(choice(songs))
