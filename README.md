# Crest
RESTful Chat API

# Deploy
[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

# Usage
Currently there is a single endpoint, `/messages`, that can be used to create a message (with a `POST` request) as well as to obtain a list of messages between users (with a `GET` request). The endpoint returns JSON.

The response will include a top-level boolean property `ok`, indicating success or failure. If `ok` is `false`, there will be an `error` property that contains a brief message.

## Messaging a user
Create a `POST` request to `/messages` with the following parameters:

```json
{
	"from": "sender_username",
	"to": "receiver_username",
	"message": "a text message"
}
```

The response looks like:

```json
{
	"ok": true,
	"message": {
		"id": "message id",
		"from": "sender_username",
		"to": "receiver_username",
		"text": "the text of the message",
		"created": "time in UTC"
	}
}
```

Or, if there is some error, it will look like:

```json
{
	"ok": false,
	"error": "error message"
}
```


## Viewing your conversations
Create a `GET` request to `/messages?users=username1,username2` to view the conversation between two users. Note that the order does not matter!

The response looks like:

```json
{
	"ok": true,
	"between": ["username1", "username2"],
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

Or, if there was some error, the response will look like:

```json
{
	"ok": false,
	"error": "error message"
}
```
