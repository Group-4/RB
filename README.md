##Guessing Game API

**Endpoints**

base_url: http://lit-shore-4262.herokuapp.com

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