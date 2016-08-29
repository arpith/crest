# Crest
RESTful Chat API

# Deploy
[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

# Usage
Currently there is a single endpoint, `/messages`, that can be used to create a message (with a `POST` request) as well as to obtain a list of messages between users (with a `GET` request). The endpoint returns JSON.

## Messaging a user
Create a `POST` request to `/messages` with the following parameters:

```json
{
	"sender": "sender_username",
	"receiver": "receiver_username",
	"text": "a text message"
}
```

The response looks like:

```json
{
	"message": {
		"id": "message id",
		"sender": "sender_username",
		"receiver": "receiver_username",
		"text": "the text of the message",
        	"created": "time in UTC",
	        "updated": "time in UTC"
	}
}
```

## Viewing your conversations
Create a `GET` request to `/messages?user1=username1&user2=username2` to view the conversation between two users. Note that the order does not matter!

The response looks like:

```json
{
	"messages": [
		{
			"id": "an id",
			"sender": "username1", 
			"receiver": "username2", 
			"text": "hi username2!",
			"created": "time in UTC",
	        	"updated": "time in UTC"
		},
		{
			"id": "another id",
			"sender": "username2",
			"receiver": "username1",
			"text": "hi username1!!",
			"created": "time in UTC",
	        	"updated": "time in UTC"
		}
	]
}
```

# Objects
## `message`
A json object with:
1. `id` string
2. `sender` username string
3. `receiver` username string
4. `text` the text of the message (string)
5. `created` time in UTC
6. `updated` time in UTC

For example,
```json
{
	"id": "an id",
	"sender": "bar",
	"receiver": "foo",
	"text": "hi foo!!",
	"created": "time in UTC",
	"updated": "time in UTC"
}
```

# Resources
## `/messages`
### `GET`
`GET /messages?user1=foo&user2=bar` retrieves a list of messages between `foo` and `bar`. Note that this includes messages sent by `foo` to `bar` as well as messages sent by `bar` to `foo` and that the order does not matter.

#### Required Parameters
1. `user1` a string username
2. `user2` a string username

#### Response
The json response has a top level attribute `messages` that is an array of [`message` objects](##message).

```json
{
	"messages": [
		{
			"id": "an id",
			"sender": "foo", 
			"receiver": "bar", 
			"text": "hi bar!",
			"created": "time in UTC",
			"updated": "time in UTC"
		},
		{
			"id": "another id",
			"sender": "bar",
			"receiver": "foo",
			"text": "hi foo!!",
			"created": "time in UTC",
			"updated": "time in UTC"
		}
	]
}
```

### `POST`
`POST /messages?sender=foo&receiver=bar&text=something` creates a message from `foo` to `bar` with the text `something`. 

#### Required Parameters
1. `sender` a string username
2. `receiver` a string username
3. `text` the text of the message (string)

#### Response
The json response has a top level attribute `message` that is a [`message` object](##message).

```json
{
	"message": {
		"id": "an id",
		"sender": "foo", 
		"receiver": "bar", 
		"text": "something",
		"created": "time in UTC",
		"updated": "time in UTC"
	}
}
```
