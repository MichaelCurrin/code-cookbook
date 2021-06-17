---
title: Slack Notify
description: A GitHub Action to send a message to a Slack channel
---

- [Marketplace](https://github.com/marketplace/actions/slack-notify) link

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

With all variables set:

```yaml
- name: Slack Notification
  uses: rtCamp/action-slack-notify@v2
  env:
    SLACK_CHANNEL: general
    SLACK_COLOR: ${{ job.status }} # or a specific color like 'green' or '#ff00ff'
    SLACK_ICON: https://github.com/rtCamp.png?size=48
    SLACK_MESSAGE: 'Post Content :rocket:'
    SLACK_TITLE: Post Title
    SLACK_USERNAME: rtCamp
    SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
```
