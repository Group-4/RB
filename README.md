##Guessing Game API

**Endpoints**

base_url: http://tiyqpic.herokuapp.com

*Sign Up*

* PATH: `POST '/users/register'`

* Required Params:
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
#status: 422 unprocessable entity
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

**Log In**

Login takes a username and password and returns the access token.

* Path: `POST /users/login`

* Required params in body:
  * Username
  * Password

* Responses: To be set

* Example success:
```
{
	"access_token": "e45142535b14ba9fa6c8269f6c19238d";
}
```

* Example failure:

```
{
	"msg": "User is not authenticated"
}
```

