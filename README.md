###QPic API Docs

base_url: http://tiyqpic.herokuapp.com

Authorization occurs by passing the key `Access-Token` with the value of the token in the header of the POST request.  All requests GET/POST/DELETE must be authenticated with a token.


Quick find:

####Users
* [User Registration](#user-registration)
`POST '/users/register'`
* [Log In](#log-in)
`POST /users/login`
* [Delete a User](#delete)
`DELETE /users/:id`
* [All Users](#all-users)
`GET /users/`
* [Get a User](#get-a-user)
`GET /users/:username`
* [Get a User's Posts](#get-a-users-posts)
`GET /users/:username/posts`
* [Get a User's Solved Posts](#get-a-users-solved-posts)
`GET /users/:username/solved`
* [Get a User's Unsolved Posts](#get-a-users-unsolved-posts)
`GET /users/:username/unsolved`
* [Get a User's Guesses](#get-a-users-guesses)
'GET /users/:username/guesses'
* [Get a User's Guesses on a Post](#get-a-users-guesses-on-a-post)
`GET /users/:username/:post_id/guesses`
* [Get Current User](#get-current-user)
`GET /users/current_user`

####Posts
* [Create a Post](#create-a-post)
`POST /posts`
* [Get a Post](#get-a-post)
`GET /posts/:id`
* [List All Posts](#list-all-posts)
`GET /posts`
* [Delete a Post](#delete-a-post)
`DELETE /posts/:id`
* [Get Winners](#get-users-who-solved-a-post)
`GET /posts/:id/winners`

####Guesses
* [Create a Guess](#create-a-guess)
`POST /posts/:id/guesses`
* [Get Guesses on a Post](#get-guesses-on-a-post)
`GET /posts/:id/guesses`
* [Get All Guesses](#get-all-guesses)
`GET /guesses`

####Leaderboard
* [Get Leaderboard](#get-leaderboard)
`GET /leaderboard`


#Users

### User Registration

`POST '/users/register'`

* **Required Params:**
  * username: string
  * email: string
  * password: string

* Optional Params (not yet implemented):
	* first name
	* last name

* Response: 
  * Status Code: 201 success, 422 unsuccessful

* Example success:

```json
{
  "username": "taylor_d",
  "email": "taylor@lies.com",
  "access_token": "75ee2fecba63c4e81914e671d9cdc4bc",
  "id": 1
}
```

* Example failure:

```json
{
  "errors": [
    "Username can't be blank"
  ]
}

{
  "errors": [
    "Email has already been taken",
    "Username has already been taken"
  ]
}
```

****

### Log In

`POST /users/login`

Login takes a username and password and returns the access token.

* **Required params in body**:
  * username: string
  * password:

* Responses: 202 success, 422 unsuccessful

* Example success:
```
{
  "user_id": 1,
  "username": "taylor_d",
  "access_token": "75ee2fecba63c4e81914e671d9cdc4bc"
}
```

* Example failure:

```
{
	"msg": "User is not authenticated"
}
```
****

### All Users

`GET /users/`

Returns an array of all users.

* Required Params: None  

* Responses: 202 success, 404 unsuccessful

* Example Success:

`/users`

```json
[
  {
    "id": 32,
    "username": "monica",
    "email": "monica@monica.com",
    "access_token": "f0433728af347289167cfc6646e398f2",
    "first": null,
    "last": null,
    "posts": 5,
    "points": 800,
    "guess_count": 0,
    "correct_count": 0,
    "win_percent": 0
  },
  {
    "id": 29,
    "username": "jamiegmoney",
    "email": "jamiegmoney@gmail.com",
    "access_token": "e18950c68597dcb82e6034f6a234f180",
    "first": null,
    "last": null,
    "posts": 0,
    "points": 850,
    "guess_count": 0,
    "correct_count": 0,
    "win_percent": 0
  },
  {
    "id": 34,
    "username": "derek",
    "email": "derek@derek.com",
    "access_token": "7445422cccfcc43b154c1a7d1f2f1087",
    "first": null,
    "last": null,
    "posts": 0,
    "points": 100,
    "guess_count": 0,
    "correct_count": 0,
    "win_percent": 0
  },
  {
    "id": 22,
    "username": "testing1233",
    "email": "testing1233@gmail.com",
    "access_token": "e23db1a7bedcd910b4f4ba4350df96d9",
    "first": null,
    "last": null,
    "posts": 1,
    "points": 200,
    "guess_count": 0,
    "correct_count": 0,
    "win_percent": 0
  },
  {
    "id": 1,
    "username": "taylor_d",
    "email": "mdaugherty6@gmail.com",
    "access_token": "8f8f6513953acb816da66077486f370b",
    "first": null,
    "last": null,
    "posts": 1,
    "points": 600,
    "guess_count": 4,
    "correct_count": 2,
    "win_percent": 50
  }
]
```
****

### Get a User

`GET /users/:username`

Returns data for a specific user.


* Required Params: None

* Optional Params: None

* Responses: 202 success, 404 unsuccessful

* Example Success:

`users/taylor_d`

```json
{
  "id": 1,
  "username": "taylor_d",
  "email": "taylor@lies.com",
  "first": null,
  "last": null,
  "posts": 1
}
```
****

### Get a User's Posts

`GET /users/:username/posts`

Returns all posts by a user.  

* Responses: 202 success, 404 unsuccessful

* Example Success:

`/users/taylor_d/posts`

```json
[
  {
    "id": 47,
    "image_url": "http://uberhumor.com/wp-content/uploads/2011/04/these_funny_animals_656_640_08.jpg",
    "user_id": 32,
    "answer": "sloth",
    "hint": null,
    "solved": 22,
    "created_at": "2015-06-20T12:43:39.533Z",
    "updated_at": "2015-06-20T22:05:01.281Z",
    "owner": "monica",
    "solved_by": "testing1233",
    "attempts": 0,
    "times_solved": 0
  },
  {
    "id": 96,
    "image_url": "http://www.precisionnutrition.com/wordpress/wp-content/uploads/2010/01/cup-of-black-coffee1.jpg",
    "user_id": 32,
    "answer": "coffee",
    "hint": "wakes you up in the morning",
    "solved": 29,
    "created_at": "2015-06-21T14:32:22.268Z",
    "updated_at": "2015-06-21T21:22:33.517Z",
    "owner": "monica",
    "solved_by": "jamiegmoney",
    "attempts": 4,
    "times_solved": 0
  },
  {
    "id": 45,
    "image_url": "http://www.imgion.com/images/01/bear-blinkkig-eyes.jpg",
    "user_id": 32,
    "answer": "bear",
    "hint": null,
    "solved": 14,
    "created_at": "2015-06-20T12:33:16.305Z",
    "updated_at": "2015-06-21T21:25:44.677Z",
    "owner": "monica",
    "solved_by": "nick",
    "attempts": 1,
    "times_solved": 0
  },
  {
    "id": 95,
    "image_url": "http://www.virginfarms.com/wp-content/uploads/2013/09/Hydrangea_Blue_Catalog.png",
    "user_id": 32,
    "answer": "hydrangea",
    "hint": "Pretty flower",
    "solved": null,
    "created_at": "2015-06-21T14:31:55.005Z",
    "updated_at": "2015-06-21T21:53:13.411Z",
    "owner": "monica",
    "solved_by": null,
    "attempts": 4,
    "times_solved": 0
  },
  {
    "id": 46,
    "image_url": "http://cdn.weruletheinternet.com//wp-content/uploads/images/2013/april/lol_animals_2/funny_animal_pictures_12.jpg",
    "user_id": 32,
    "answer": "seaotterreachingforicecreamsandwich",
    "hint": null,
    "solved": null,
    "created_at": "2015-06-20T12:35:57.090Z",
    "updated_at": "2015-06-21T12:48:28.872Z",
    "owner": "monica",
    "solved_by": null,
    "attempts": 3,
    "times_solved": 0
  }
]
```
****

### Get a User's Solved Posts

`GET /users/:username/solved`

Returns all posts that a user has solved.

* Required Params: None

* Optional Params: 
  * `?page=#page`
  * pagination - 27 per page

* Responses: 202 success, 404 unsuccessful

* Example Success:

`users/taylor_d/solved`

```json
[
  {
    "id": 1,
    "image_url": "image.jpg",
    "user_id": 1,
    "answer": "toast",
    "hint": null,
    "solved": 1,
    "created_at": "2015-06-19T19:43:50.149Z",
    "updated_at": "2015-06-19T19:44:59.333Z",
    "owner": "taylor_d",
    "solved_by": "taylor_d"
  }
]
```
### Get a User's Unsolved Posts

`GET /users/:username/unsolved`

Returns all posts that a user has NOT solved.

* Required Params: None

* Optional Params: 
  * `?sort=difficult`: sorts the unsolved posts by most attempts
  * `?page=#page`: 27 per page

* Responses: 202 success, 404 unsuccessful

* Example Success:

`users/taylor_d/solved`

```json
[
  {
    "id": 2,
    "image_url": "bread.png",
    "user_id": 1,
    "answer": "sandwhich",
    "hint": null,
    "solved": null,
    "created_at": "2015-06-19T19:53:42.122Z",
    "updated_at": "2015-06-19T19:53:42.122Z",
    "owner": "taylor_d",
    "solved_by": null
  },
  {
    "id": 3,
    "image_url": "bun.gif",
    "user_id": 1,
    "answer": "hamburger",
    "hint": null,
    "solved": null,
    "created_at": "2015-06-19T19:53:56.029Z",
    "updated_at": "2015-06-19T19:53:56.029Z",
    "owner": "taylor_d",
    "solved_by": null
  }
]
```

****

### Get a User's Guesses

'GET /users/:username/guesses'

Returns user object for the user logged in.

* Required Params: None

* Optional Params: None

* Responses: 202 success, 404 unsuccessful

* Example Success:

`users/taylor_d/guesses`

```json
[
  {
    "id": 2,
    "user_id": 2,
    "post_id": 1,
    "guess": "try1",
    "created_at": "2015-06-21T00:46:58.074Z",
    "updated_at": "2015-06-21T00:46:58.074Z",
    "correct": false
  },
  {
    "id": 3,
    "user_id": 2,
    "post_id": 1,
    "guess": "try2",
    "created_at": "2015-06-21T00:47:00.364Z",
    "updated_at": "2015-06-21T00:47:00.364Z",
    "correct": false
  },
  {
    "id": 4,
    "user_id": 2,
    "post_id": 1,
    "guess": "try3",
    "created_at": "2015-06-21T00:47:02.491Z",
    "updated_at": "2015-06-21T00:47:02.491Z",
    "correct": false
  },
  {
    "id": 5,
    "user_id": 2,
    "post_id": 1,
    "guess": "test",
    "created_at": "2015-06-21T00:47:06.955Z",
    "updated_at": "2015-06-21T00:47:06.966Z",
    "correct": true
  },
  {
    "id": 6,
    "user_id": 2,
    "post_id": 2,
    "guess": "isthiscorrect",
    "created_at": "2015-06-21T01:09:17.421Z",
    "updated_at": "2015-06-21T01:09:17.421Z",
    "correct": false
  },
  {
    "id": 7,
    "user_id": 2,
    "post_id": 2,
    "guess": "isthiscorrect",
    "created_at": "2015-06-21T01:09:18.493Z",
    "updated_at": "2015-06-21T01:09:18.493Z",
    "correct": false
  },
  {
    "id": 8,
    "user_id": 2,
    "post_id": 2,
    "guess": "isthiscorrect",
    "created_at": "2015-06-21T01:09:19.258Z",
    "updated_at": "2015-06-21T01:09:19.258Z",
    "correct": false
  }
]

```

### Get a User's Guesses on a Post

`GET /users/:username/:post_id/guesses`

* Required Params: None

* Optional Params: None

* Responses: 202 success, 404 unsuccessful

* Example Success:

`users/taylor_d/2/guesses`

```json
[
  {
    "id": 6,
    "user_id": 2,
    "post_id": 2,
    "guess": "isthiscorrect",
    "created_at": "2015-06-21T01:09:17.421Z",
    "updated_at": "2015-06-21T01:09:17.421Z",
    "correct": false
  },
  {
    "id": 7,
    "user_id": 2,
    "post_id": 2,
    "guess": "isthiscorrect",
    "created_at": "2015-06-21T01:09:18.493Z",
    "updated_at": "2015-06-21T01:09:18.493Z",
    "correct": false
  },
  {
    "id": 8,
    "user_id": 2,
    "post_id": 2,
    "guess": "isthiscorrect",
    "created_at": "2015-06-21T01:09:19.258Z",
    "updated_at": "2015-06-21T01:09:19.258Z",
    "correct": false
  },
  {
    "id": 9,
    "user_id": 2,
    "post_id": 2,
    "guess": "isthiscorrect",
    "created_at": "2015-06-21T01:09:19.957Z",
    "updated_at": "2015-06-21T01:09:19.957Z",
    "correct": false
  },
  {
    "id": 10,
    "user_id": 2,
    "post_id": 2,
    "guess": "isthiscorrect",
    "created_at": "2015-06-21T01:09:20.658Z",
    "updated_at": "2015-06-21T01:09:20.658Z",
    "correct": false
  },
  {
    "id": 11,
    "user_id": 2,
    "post_id": 2,
    "guess": "isthiscorrect",
    "created_at": "2015-06-21T01:09:21.288Z",
    "updated_at": "2015-06-21T01:09:21.288Z",
    "correct": false
  },
  {
    "id": 12,
    "user_id": 2,
    "post_id": 2,
    "guess": "isthiscorrect",
    "created_at": "2015-06-21T01:09:21.942Z",
    "updated_at": "2015-06-21T01:09:21.942Z",
    "correct": false
  }
]
```

****

### Get Current User

`GET /users/current_user`

Returns user object for the user logged in.

* Required Params: None

* Optional Params: None

* Responses: 202 success, 404 unsuccessful

* Example Success:

`users/taylor_d/solved`

```json
{
  "id": 1,
  "username": "taylor_d",
  "first": null,
  "last": null,
  "email": "taylor@lies.com",
  "password": "5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8",
  "access_token": "09c817cb1bedba564407c615e002050d",
  "created_at": "2015-06-21T23:58:05.124Z",
  "updated_at": "2015-06-21T23:58:05.124Z",
  "points": 0,
  "guess_count": 0,
  "incorrect_count": 0,
  "correct_count": 0,
  "win_percent": 0
}
```


#Posts

* The `solved` field is the user_id of the FIRST person to solve the post.  

* Attempts is the total times that post has been guessed on.

* Times_solved is the number of time the post has been solved.

### Create a Post

`POST /posts`

Create a new post. 

* **Required params**: image_url, answer

* Optional params: hint

Status Code: 201 success, 422 unsuccessful

* Example Success:

```json
{
  "id": 4,
  "image_url": "http://www.facebook.com",
  "user_id": 1,
  "answer": "facebook",
  "hint": null,
  "solved": false,
  "created": "2015-06-18T12:49:04.279Z",
  "updated": "2015-06-18T12:49:04.279Z"
}
```

* Example Failure

**In Progress**
```json
{
  "message": "Access Token not found."
}
```
****

### Get a Post

`GET /posts/:id`

Get data for a single post.

* Responses: 202 success, 404 unsuccessful

* Example Success:

```json
{
  "post_id": 2,
  "owner": "taylor",
  "url": "test.jpg",
  "answer": "test1",
  "hint": null,
  "solved": null,
  "solved_by": null,
  "attempts": 7,
  "times_solved": 0
}

```

### Delete a Post

`DELETE /posts/:id`

Deletes a post submitted by a user and all associated guesses on that post.

**note:** *A user can only delete a post that they own.*

* Responses: 202 accepted, 401 unauthorized

* Example Success:

`/posts/24`

```json
{
  "msg": "post deleted"
}
```
****

### List All Posts

`GET /posts`

List all posts by all users.  

* Required params: none  

* Responses: 202 success, 404 unsuccessful

* Example Success:

```json
[
  {
    "id": 98,
    "image_url": "http://www.clker.com/cliparts/b/e/4/7/13698736341614966359baby-tiger-f-hi.png",
    "user_id": 33,
    "answer": "babytiger",
    "hint": "Little ferocious animal",
    "solved": 1,
    "created_at": "2015-06-21T14:41:04.634Z",
    "updated_at": "2015-06-22T00:48:37.639Z",
    "owner": "evelyn",
    "solved_by": "taylor_d",
    "attempts": 6,
    "times_solved": 1
  },
  {
    "id": 97,
    "image_url": "http://lafeber.com/pet-birds/wp-content/uploads/parrot.png",
    "user_id": 33,
    "answer": "parrot",
    "hint": "colorful bird",
    "solved": 1,
    "created_at": "2015-06-21T14:39:44.927Z",
    "updated_at": "2015-06-22T00:51:02.352Z",
    "owner": "evelyn",
    "solved_by": "taylor_d",
    "attempts": 8,
    "times_solved": 1
  },
  {
    "id": 96,
    "image_url": "http://www.precisionnutrition.com/wordpress/wp-content/uploads/2010/01/cup-of-black-coffee1.jpg",
    "user_id": 32,
    "answer": "coffee",
    "hint": "wakes you up in the morning",
    "solved": 29,
    "created_at": "2015-06-21T14:32:22.268Z",
    "updated_at": "2015-06-21T21:22:33.517Z",
    "owner": "monica",
    "solved_by": "jamiegmoney",
    "attempts": 4,
    "times_solved": 0
  },
  {
    "id": 95,
    "image_url": "http://www.virginfarms.com/wp-content/uploads/2013/09/Hydrangea_Blue_Catalog.png",
    "user_id": 32,
    "answer": "hydrangea",
    "hint": "Pretty flower",
    "solved": null,
    "created_at": "2015-06-21T14:31:55.005Z",
    "updated_at": "2015-06-21T21:53:13.411Z",
    "owner": "monica",
    "solved_by": null,
    "attempts": 4,
    "times_solved": 0
  },
  {
    "id": 94,
    "image_url": "http://www.mygreenbasil.com/wp-content/uploads/2014/07/basil-leaf.png",
    "user_id": 31,
    "answer": "basil",
    "hint": "Herb yummy with tomatoes.",
    "solved": null,
    "created_at": "2015-06-21T14:10:59.289Z",
    "updated_at": "2015-06-21T14:10:59.289Z",
    "owner": "krose422",
    "solved_by": null,
    "attempts": 0,
    "times_solved": 0
  }
]
```
****

### Get Winners

`GET /posts/:id/winners`

Lists all users who have solved a post.

* Required params: none

* Responses: 202 success, 404 unsuccessful

* Example Success:

```json
[
  {
    "id": 2,
    "username": "taylor1",
    "first": null,
    "last": null,
    "email": "taylor1@lies.com",
    "password": "5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8",
    "access_token": "9b42bec441cfc785509c0b5fa511d6c9",
    "created_at": "2015-06-21T00:42:56.292Z",
    "updated_at": "2015-06-22T00:35:08.241Z",
    "points": 400,
    "guess_count": 3,
    "incorrect_count": 2,
    "correct_count": 1,
    "win_percent": 33.3333333333333
  }
]
```
#Guesses

### Create a Guess

`POST /posts/:id/guesses`

Create a guess on a post.  

* **Required Params**: 
  * guess

* Optional params: 
  * none

* Response: 
  * Status Code: 201 success, 422 unsuccessful

* Example Success:

`post/1/guess`

params:

`guess: chipmunk`

```json
{
  "id": 3,
  "guess": "chipmunk",
  "user_id": 1,
  "post_id": 1
}

```

* Example failure:

```json
{
  "errors": [
    "Guess can't be blank"
  ]
}

{
  "message": "Access Token not found."
}
```

***

### Get Guesses on a Post

`GET /posts/:id/guesses`

List all guesses on a specific post.  

* Required params: none  

* Responses: 202 success, 404 unsuccessful

* Example Success:

`/post/1/guesses`

```json
[
  {
    "id": 65,
    "user_id": 32,
    "post_id": 29,
    "guess": "mountain",
    "created_at": "2015-06-20T14:21:31.196Z",
    "updated_at": "2015-06-20T14:21:31.202Z",
    "correct": true
  },
  {
    "id": 66,
    "user_id": 14,
    "post_id": 29,
    "guess": "mountain",
    "created_at": "2015-06-20T14:21:56.509Z",
    "updated_at": "2015-06-20T14:21:56.516Z",
    "correct": true
  }
]

```

***

### Get All Guesses

`GET /guesses`

List all guesses by all users on all posts.  

* Required params: none  

* Responses: 202 success, 404 unsuccessful

* Example Success:

```json
[
  {
    "id": 1,
    "user_id": 14,
    "post_id": 17,
    "guess": "capitol",
    "created_at": "2015-06-19T16:30:14.739Z",
    "updated_at": "2015-06-19T16:30:14.739Z",
    "correct": null
  },
  {
    "id": 2,
    "user_id": 14,
    "post_id": 15,
    "guess": "stool",
    "created_at": "2015-06-19T16:32:17.648Z",
    "updated_at": "2015-06-19T16:32:17.648Z",
    "correct": null
  },
  {
    "id": 3,
    "user_id": 14,
    "post_id": 0,
    "guess": "mountains",
    "created_at": "2015-06-19T16:41:48.233Z",
    "updated_at": "2015-06-19T16:41:48.233Z",
    "correct": null
  },
  {
    "id": 153,
    "user_id": 14,
    "post_id": 38,
    "guess": "giraffe",
    "created_at": "2015-06-20T22:21:01.520Z",
    "updated_at": "2015-06-20T22:21:01.520Z",
    "correct": false
  },
  {
    "id": 154,
    "user_id": 14,
    "post_id": 38,
    "guess": "airwatch",
    "created_at": "2015-06-20T22:21:04.677Z",
    "updated_at": "2015-06-20T22:21:04.677Z",
    "correct": false
  },
  {
    "id": 157,
    "user_id": 33,
    "post_id": 32,
    "guess": "snack",
    "created_at": "2015-06-20T22:29:08.155Z",
    "updated_at": "2015-06-20T22:29:08.155Z",
    "correct": false
  }
]

```
***

#Leaderboard

### Get Leaderboard

The scoring system is as so: 200 points for first person to solve it, 100 for the second, 75 for the third, and 50 after for any solve after that.

`GET /leaderboard`  

* Required params: none  

* Optional params:
  * `?sort=ratio` will sort by win percentage

* Responses: 201 created, 404 unsuccessful

* Example Success:

```json
[
  {
    "id": 14,
    "username": "nick",
    "points": 3500,
    "correct_count": 0,
    "win_percent": 0
  },
  {
    "id": 31,
    "username": "krose422",
    "points": 1250,
    "correct_count": 0,
    "win_percent": 0
  },
  {
    "id": 33,
    "username": "evelyn",
    "points": 950,
    "correct_count": 0,
    "win_percent": 0
  },
  {
    "id": 29,
    "username": "jamiegmoney",
    "points": 850,
    "correct_count": 0,
    "win_percent": 0
  },
  {
    "id": 32,
    "username": "monica",
    "points": 800,
    "correct_count": 0,
    "win_percent": 0
  },
  {
    "id": 15,
    "username": "testing1128",
    "points": 700,
    "correct_count": 0,
    "win_percent": 0
  },
  {
    "id": 1,
    "username": "taylor_d",
    "points": 600,
    "correct_count": 2,
    "win_percent": 50
  },
  {
    "id": 35,
    "username": "test9",
    "points": 400,
    "correct_count": 0,
    "win_percent": 0
  },
  {
    "id": 22,
    "username": "testing1233",
    "points": 200,
    "correct_count": 0,
    "win_percent": 0
  },
  {
    "id": 34,
    "username": "derek",
    "points": 100,
    "correct_count": 0,
    "win_percent": 0
  }
]

```

