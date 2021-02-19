![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Hollywood API


## Introduction
Everyone likes celebrities, right? Well, even if you don't, now is your chance to create your own, better, fictional celebrities!
Let's create an Flask API with all the basic CRUD actions that will allow the user to create their own celebrities and edit them as they see fit.

The user should be able to:

**1. See the list of celebrities**\
**2. See the details of a celebrity**\
**3. Add new celebrities**\
**4. Update existing celebrities**\
**5. Delete celebrities**

But wait! That's not all!

Once we have our celebrities, we need something for them to do!
Let's make up some movie ideas for our celebrities to star in.  
That means we'll need all the basic CRUD actions for movies as well.  

The user should be able to:

**6. See the list of movies.**\
**7. See the details of a movie.**\
**8. Add new movies.**\
**9. Update existing movies.**\
**10. Delete movies.**


## Requirements

- Fork this repo
- Clone this repo


## Submission

- Upon completion, run the following commands:

```
$ git add <files>
$ git commit -m "<message>"
$ git push origin master
```
- Create Pull Request so your Instructors can check up your work.


## Instructions

**Don't be afraid to modulate your code, use different functions and different files!**

## Iteration #0: The Database

Make sure your MongoDB Server is started and running.

Create a new database, it should have 2 collections, one for celebrities and one for movies.

Now you are ready to start 🚀


## Iteration #1: pymongo Connection

### Steps we will follow in this iteration:

1. Create the `mongoConnection.py` file in the `helpers/` folder.
2. In the `mongoConnection.py` file:
    - Create a pymongo Client.
    - Write two functions, one to read data from a given collection and one to insert data into a given collection.

Use this moment to test your functions and seed the database with a few celebrities to get us started.

### Celebrities
The `Celebrity` object should have:
- `name` - string (like _Tom Cruise, Beyonce, Daffy Duck,_ etc.)
- `occupation` - string (what the celebrity does, why they are famous.  For example _actor, singer, comedian_, or you can put _unknown_ if your celebrity is someone like Kim Kardashian)
- `catch_phrase` - string (every celebrity needs a good catch phrase.  Well maybe not all of them have one in real life, but all of _our_ celebrities will have a catch phrase.  This can be pretty much anything)

## Iteration #2: Listing Our Celebrities

Now that we've got some celebrities in the database and a fully working connection with mongoDB, we can start working with them in our api. Let's **display a list of all the celebrities**.

Here's the route we will be using:

|   Endpoint   | HTTP Verb |   Description   |
|-----------|-----------|-----------------|
| `/celebrities` |    GET    | Show all celebrities |

### Steps we will follow in this iteration:

1. Begin writing our API on the `api.py` file.
2. Create the app object.
3. Use the flask decorator to asign the endpoint `/celebrities` to a python function.
4. Using the functions you previously wrote on `mongoConnection.py`, make this endpoint return the _name_ and _ObjectID_ of all the celebrities on the database.

## Iteration #3: The Celebrity Details

We've got a list of celebrities that displays each of their `name` and `_id`, but what if we want to see the other details? 

Here's the route we will be using:

|     Route     | HTTP Verb |      Description      | Parameters |
|---------------|-----------|-----------------------|-----|
| `/celebrities/details` |    GET    | Show a specific celebrity | id: Celebrity ObjectID |


### Steps we will follow in this iteration:

1. Create the `/celebrities/details` route in `api.py`.
2. In the route function:
    - Receive the id parameter.
    - Fetch the information from the database for given id.
    - Return the information on the chosen celebrity in json format.
3. Handle the errors:
    - What if the given id is not valid?
    - Create a default response in case the id in the request does not belong to any of our celebrities.

## Iteration #4: Adding New Celebrities

Now that we have a list of celebrities, as well as a personalized details page for each celebrity, let's make it so the user can **add new celebrities to the database**

|     Route     | HTTP Verb |          Description          |
|---------------|-----------|-------------------------------|
| `/celebrities/new` |    GET    | Insert a new celebrity |


### Steps we will follow in this iteration:

1. Use the flask decorator to asign the route to a python function.
2. In that function:
  - Check that there is no celebrity with the same name already in the database. Return an error message if the celebrity already exists.
  - Check that all the mandatory parameters were sent on the request. Return error message if not.
  - Insert the new celebrity in the database and return its ObjectId.

## Iteration #5: Deleting Celebrities

Now that we have a list of celebrities, a celebrity details page, and a route to create new celebrities, we only have 2 features left to implement: editing celebrities and deleting them.  Since deleting is simpler, let's start with that.

|        Route         | HTTP Verb |       Description       | Parameter |
|----------------------|-----------|-------------------------|---|
| `/celebrities/delete` |   GET    | Delete a specific celebrity | id |

### Steps we will follow in this iteration:

1. Use the flask decorator to asign the route to a python function.
2. You might need to write a new function on `mongoConnection.py`.
3. In that function:
  - Check that a celebrity with the given id exists, return an error message if not.
  - Delete the celebrity with the given id from the database.


## Iteration #6: Editing Celebrities

Final piece of our CRUD puzzle: **editing existing celebrities**.

Here are the routes we will be using:

|       Route        | HTTP Verb |          Description          | Parameters |
|--------------------|-----------|-------------------------------|---|
| `/celebrities/edit` |    GET    | Edit a celebrity | Mandatory: id, Optional: name, occupation, catch_phrase


### Steps we will follow in this iteration:

1. Use the flask decorator to asign the route to a python function.
2. You might need to write a new function on `mongoConnection.py`.
3. In the function:
    - Check that an `id` was passed on the request and that this `id` belongs to a valid celebrity. Return an error message if any of the conditions fails.
    - Check that at least one of the optional parameters was passed on the request.
    - Update the parameter with the new value.
    - Return the updated details of the celebrity.

## Celebrities - Done!

At this point, we have implemented all the basic CRUD actions for celebrities in our api.  Nice work!


# Bonus
Now that we've done all this good work, it's time to do it all over again, but for the movies.  After all, what's the point of having all these celebrities if we can't make up fake movies to cast them in?

This is where you'll test yourself with a few less instructions. 

We are going to create `/movies` endpoints and implement all the same CRUD actions for this as well.  Don't worry, it's really much easier the second time around.  

### Movies

The `movies` object should have:
- `title` - string
- `year` - integer
- `genre` - string
- `plot` - string


## Create the following endpoints in `api.py`:

|       Route        | HTTP Verb |          Description          | Parameters |
|--------------------|-----------|-------------------------------|---|
|`/movies`|GET|List all the movies titles and `_id`||
|`/movies/details`|GET|Show specific movie|id|
|`/movies/new`|GET|Create a new movie|title,year,genre,plot|
|`/movies/delete`|GET|Delete a specific movie|id|
| `/movies/edit` |    GET    | Edit a movie | Mandatory: id, Optional: title, year, genre, plot

# Advanced
|       Route        | HTTP Verb |          Description          | Parameters |
|--------------------|-----------|-------------------------------|---|
|`/movies/cast/add`|GET|Add a celebrity to the cast of a movie| movie_id, celebrity_id|

Add an attribute to the `movies` objects:
- `cast` - array of ObjectID
It should contain the ObjectID's of the celebrities

You must make sure that both ids, for movie and celebrity are valid.

|       Route        | HTTP Verb |          Description          | Parameters |
|--------------------|-----------|-------------------------------|---|
|`/celebrities/works`|GET|List all the movies a specific celebrity has starred in| id|

# That's it!

Happy Coding! :heart:
