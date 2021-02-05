## musicAPI

### Endpoints

#### /user/create
- parameters: name, username
- Creates an user on database

#### /user/list
- parameters: None
- returns all users in database

#### /music/add
- parameters: username, song_title, song_url
- Adds Song to songs collection

#### /music/list
- parameters: username(Optional)
- Lists all songs in database from given user (or all Songs if no user)

#### /music/random
- parameters: None
- Return a random song url