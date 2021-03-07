# Tweet

Using [tweepy](https://pypi.org/project/tweepy/) package from `pypi`.

See my [Python Twitter Guide](https://michaelcurrin.github.io/python-twitter-guide/) for more info on getting dev flow, approaches to auth and using how to do other things with Tweepy.

- `tweet.py
    ```python
    import os
    import sys
    
    import tweepy
    
    
    CONSUMER_KEY = os.environ.get('CONSUMER_KEY')
    CONSUMER_SECRET = os.environ.get('CONSUMER_SECRET')
    ACCESS_KEY = os.environ.get('ACCESS_KEY')
    ACCESS_SECRET = os.environ.get('ACCESS_SECRET')


    def main(args):
        """
        Command line entrypoint to post a tweet message to Twitter.
        """
        if not args:
            print("Provide a message on the CLI as the first argument.")
            print("It must a single string. Multiple lines are allowed.")
            
            return None
        
        msg = args[0]

        auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
        auth.set_access_token(ACCESS_KEY, ACCESS_SECRET)
        api = tweepy.API(auth)

        print(f"Tweeting message: {msg}")
        tweet = api.update_status(msg)
        
    
    if __name__ == "__main__":
        main(sys.argv[1:)
    ```
