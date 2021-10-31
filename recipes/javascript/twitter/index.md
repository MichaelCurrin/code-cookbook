# Twitter

How to use JavaScript to interact with the Twitter API.

For getting a list of Tweet, this not recommended on the browser side because you'll expose your account's credentials. Set up a backend API server or serverless function so you can run Node code that hides the credentials from the user.

If you want to tweet as the user, you could do this with Node or on the client. Either way, you'll probably want to do a user flow such that the user signs into Twitter on your site and then you have a generated token to tweet on their behalf with.


### Resources 

- [Resources](https://michaelcurrin.github.io/python-twitter-guide/#/resources) page on my Python Twitter Guide.
