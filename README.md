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
	"from": "sender_username",
	"to": "receiver_username",
	"text": "a text message"
}
```

The response looks like:

```json
{
	"message": {
		"id": "message id",
		"from": "sender_username",
		"to": "receiver_username",
		"text": "the text of the message",
		"created": "time in UTC"
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
			"from": "username1", 
			"to": "username2", 
			"text": "hi username2!",
			"created": "time in UTC"
		},
		{
			"id": "another id",
			"from": "username2",
			"to": "username1",
			"text": "hi username1!!",
			"created": "time in UTC"
		}
	]
}
```
