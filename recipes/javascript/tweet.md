# Tweet


## Twitter API client

```javascript 
import { TwitterClient } from 'twitter-api-client';

function setupConn() {
  return new TwitterClient({
    apiKey: process.env.TWITTER_API_KEY,
    apiSecret: process.env.TWITTER_API_SECRET,
    accessToken: process.env.TWITTER_API_ACCESS_TOKEN,
    accessTokenSecret: process.env.TWITTER_ACCESS_TOKEN_SECRET,
  });
}

async function tweet(api, message) {
  await api.tweets.statusesUpdate({ status: message });
};

(async () => {
  const api = setupConn()
  const message = "Hello, World!"

  await tweet(api, message);
})();
```
