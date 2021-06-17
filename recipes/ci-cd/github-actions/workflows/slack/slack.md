---
title: slack - GitHub Actions Slack integration
---

[Marketplace link](https://github.com/marketplace/actions/slack-github-actions-slack-integration)

{% raw %}

The `status` determines if it appears as a success or failure in Slack.

```yaml
steps:
  - name: Build
    # Do stuff
    
  - name: Post to Slack - error
    uses: act10ns/slack@v1
    if: failure()
    with: 
      status: ${{ job.status }}
      channel: '#workflows'
    env:
      SLACK_WEBHOOK_URL: ${{ secrets.SLACK_WEBHOOK_URL }}
```

You might also want to post a message on every run and to use the Slack hook at the job level instead of the step level.

```yaml
build:
  env:
    SLACK_WEBHOOK_URL: ${{ secrets.SLACK_WEBHOOK_URL }}
    
  steps:
    - name: Post to Slack - starting
      uses: act10ns/slack@v1
      with:
        status: starting
        channel: '#workflows'
      if: always()
```

{% endraw %}
