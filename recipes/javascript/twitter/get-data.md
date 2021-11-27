# Get data

Using [twitter-api-client](https://www.npmjs.com/package/twitter-api-client).

```javascript 
// Search for a user.
const data = await twitterClient.accountsAndUsers.usersSearch(
  { q: 'twitterDev' }
);

// Get message event by ID
const data = await twitterClient.directMessages.directMessagesEventsShow(
  { id: '1234' }
);

// Get most recent 25 retweets of a tweet
const data = await twitterClient.tweets.statusesRetweetsById(
  { id: '12345', count: 25 }
);

// Get local trends
const data = await twitterClient.trends.trendsAvailable();
```
