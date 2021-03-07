---
title: Python
description: Using Python and the Tweepy package to post a tweet
---

Here we setup a short Python script which can be run locally or using GH Actions to post a tweet to your Twitter account.


## Example

See **Tweet GitHub Actions** as a simple template repo that you can use.

[![MichaelCurrin - tweet-gh-actions-py](https://img.shields.io/static/v1?label=MichaelCurrin&message=tweet-gh-actions-py&color=blue&logo=github)](https://github.com/MichaelCurrin/tweet-gh-actions-py)


## Setup scripts

See [Tweet][] in the Python section this project for file below.

Add files to your repo:

- `requirements.txt`
- `tweet.py`

[Tweet]: {{ site.baseurl }}{% link recipes/python/tweet.md %}


## Configure workflow

Setup a workflow to handle:

- Python
- Python packages
- Environment variables
- Posting a tweet

The workflow file of the Tweet GitHub Actions repo linked above for a reference.
