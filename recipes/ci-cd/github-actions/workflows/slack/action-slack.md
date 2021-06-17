---
title: action-slack
---

- [Marktplace](https://github.com/marketplace/actions/action-slack)

{% raw %}

## Sample

```yaml
steps:
  - name: Slack
    uses: 8398a7/action-slack@v3
    with:
      status: ${{ job.status }}
      fields: repo,message,commit,author,action,eventName,ref,workflow,job,took # selectable (default: repo,message)
    env:
      SLACK_WEBHOOK_URL: ${{ secrets.SLACK_WEBHOOK_URL }} # required
```

{% endraw %}
