###Guessing Game API Docs

base_url: http://tiyqpic.herokuapp.com

**Endpoints**

####Users
* [Sign Up](#sign-up)
* [Log In](#log-in)
* [All Users](#all-users)
* [Get a User](#get-a-user)

####Posts
* [Create a Post](#create-a-post)
* [Get a Post](#get-a-post)
* [Get a User's Posts](#get-a-users-posts)
* [List All Posts](#list-all-posts)


####Guesses
* [Get All Guesses](#get-all-guesses)
* [Create a Guess](#create-a-guess)
* [Get Guesses on a Post](#get-guesses-on-a-post)

#Users

### Sign Up

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

* Optional Params: Pagination?  

* Responses: 202 success, 404 unsuccessful

* Example Success:

`/users`

```json
[
  {
    "id": 1,
    "username": "taylor_d",
    "email": "taylor@lies.com",
    "first": null,
    "last": null,
    "posts": 1
  },
  {
    "id": 2,
    "username": "taylor2",
    "email": "taylor1@lies.com",
    "first": null,
    "last": null,
    "posts": 0
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

#Posts

### Create a Post

`POST /posts`

Create a new post.  Must be authenticated.  

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
  "id": 3,
  "image_url": "http://www.reddit.com",
  "user_id": 1,
  "answer": "reddit",
  "hint": null,
  "solved": nil,
  "created": "2015-06-18T12:38:40.808Z",
  "updated": "2015-06-18T12:38:40.808Z"
}

```

### Get a User's Posts

`GET /users/:username/posts`

Returns all posts by a user.  

* Responses: 202 success, 404 unsuccessful

* Example Success:

`/users/taylor_d/posts`

```json
{
  "username": "taylor_d",
  "posts": [
    {
      "id": 1,
      "url": "www.google.com",
      "answer": "google",
      "hint": null,
      "solved": nil
    },
    {
      "id": 2,
      "url": "http://www.github.com",
      "answer": "github",
      "hint": null,
      "solved": nil
    },
    {
      "id": 3,
      "url": "http://www.reddit.com",
      "answer": "reddit",
      "hint": null,
      "solved": nil
    }
  ]
}
```
****

### List All Posts

`GET /posts`

List all posts by all users.  

* Required params: none

* Optional params: pagination?  

* Responses: 202 success, 404 unsuccessful

* Example Success:

```json
[
  {
    "id": 1,
    "user": "taylor_d",
    "posts": [
      {
        "id": 1,
        "url": "www.google.com",
        "answer": "google",
        "hint": null,
        "solved": false
      },
      {
        "id": 2,
        "url": "http://www.github.com",
        "answer": "github",
        "hint": null,
        "solved": false
      },
      {
        "id": 3,
        "url": "http://www.reddit.com",
        "answer": "reddit",
        "hint": null,
        "solved": false
      },
      {
        "id": 4,
        "url": "http://www.facebook.com",
        "answer": "facebook",
        "hint": null,
        "solved": nil
      }
    ]
  },
  {
    "id": 2,
    "user": "taylor2",
    "posts": [
      {
        "id": 5,
        "url": "http://www.arstechnica.com",
        "answer": "ars",
        "hint": null,
        "solved": nil
      }
    ]
  }
]
```
****

#Guesses

### Create a Guess

`POST /post/:id/guess`

Create a guess on a post.  Must be authenticated.

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

`GET /post/:id/guesses`

List all guesses on a specific post.  

* Required params: none

* Optional params: pagination?  

* Responses: 202 success, 404 unsuccessful

* Example Success:

`/post/1/guesses`

```json
[
  {
    "guess_id": 1,
    "guess": "rhino",
    "user_id": 1
  },
  {
    "guess_id": 2,
    "guess": "buffalo",
    "user_id": 1
  },
  {
    "guess_id": 3,
    "guess": "chipmunk",
    "user_id": 1
  }
]

```

***

### Get All Guesses

`GET /guesses`

List all guesses by all users on all posts.  

* Required params: none

* Optional params: pagination?  

* Responses: 202 success, 404 unsuccessful

* Example Success:

```json
[
  {
    "id": 1,
    "guess": "rhino",
    "user_id": 1,
    "post_id": 1
  },
  {
    "id": 2,
    "guess": "buffalo",
    "user_id": 1,
    "post_id": 1
  },
  {
    "id": 3,
    "guess": "chipmunk",
    "user_id": 1,
    "post_id": 1
  }
]

```

