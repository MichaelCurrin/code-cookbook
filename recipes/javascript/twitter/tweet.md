---
title: Tweet
description: Post a tweet to Twitter using JS and the Twitter API
---

## Using Twitter API client package

Install this package.

- [twitter-api-client](https://www.npmjs.com/package/twitter-api-client)

Set your Twitter dev token on environment variables.

Set up this Node script and run it.

```javascript 
import { TwitterClient } from 'twitter-api-client';

function setupConn() {
  const credentials = {
    apiKey: process.env.TWITTER_API_KEY,
    apiSecret: process.env.TWITTER_API_SECRET,
    accessToken: process.env.TWITTER_API_ACCESS_TOKEN,
    accessTokenSecret: process.env.TWITTER_ACCESS_TOKEN_SECRET,
  };

  return new TwitterClient(...credentials)
}

async function postTweet(api, message) {
  await api.tweets.statusesUpdate({ status: message });
};

async function tweet(message) {
  const api = setupConn()
  await postTweet(api, message);
}

(async function() {
  const message = "Hello, World!"

  await tweet(message)
})();
```

Ideas to extend:

- randomize the message. 
- take the message as a CLI parameter.
- put this code behind a Node express serve or serverless function, where message comes in on the endpoint. Note you'll need to look up more advanced user-based auth if you want to tweet on behalf of a user on your app.
