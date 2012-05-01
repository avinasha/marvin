SupportBee Web Hook To Campfire

Adding campfire support to SupportBee is very using SupportBee's web hook feature. Fork this repo and host it on heroku to get going. 

# Setting up Campfire configuration

You can setup your campfire account by setting specific ENV variables on heroku

```
$ heroku config:add MARVIN_CAMPFIRE_ACCOUNT="<campfire_subdomain>"
$ heroku config:add MARVIN_CAMPFIRE_TOKEN="<campfire_token>"
$ heroku config:add MARVIN_CAMPFIRE_ROOM_IDS="<campfire_room_id>"
```

Once you push the app to heroku, add the following URL in the web hook screen of supportbee

```
http://<heroku_app_url>/supportbee
```

A campfire notification will be sent every time there is a new ticket.