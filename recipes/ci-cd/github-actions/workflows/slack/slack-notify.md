---
title: Slack Notify
description: A GitHub Action to send a message to a Slack channel
---

[Marketplace](https://github.com/marketplace/actions/slack-notify) link

This is currently the post popular action.


## Sample

```yaml
name: Slack Notification Demo

on: push

jobs:
  slack-notification:
    name: Slack Notification
    
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout
        uses: actions/checkout@v2
        
      - name: Slack Notification
        uses: rtCamp/action-slack-notify@v2
        env:
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
```
