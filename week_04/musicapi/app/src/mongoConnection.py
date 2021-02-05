from pymongo import MongoClient

client = MongoClient()

users = client.musicapi.users
music = client.musicapi.music

def insert_user(**user):
    res = users.insert_one(user)
    return res.inserted_id

def insert_song(**song):
    res = music.insert_one(song)
    return res.inserted_id

def fetch_songs():
    res = music.find({}, {"song_title":1, "song_url":1 ,"_id":0})
    return list(res)