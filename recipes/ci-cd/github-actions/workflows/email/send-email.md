---
title: Send email
description: An action that simply sends a mail to multiple recipients
---

[Marketplace](https://github.com/marketplace/actions/send-email) link

{% raw %}


## Sample

Based on the docs.

```yaml
steps:
  - name: Send mail
    uses: dawidd6/action-send-mail@v3
    with:
      server_address: smtp.gmail.com
      server_port: 465
      
      username: ${{ secrets.MAIL_USERNAME }}
      password: ${{ secrets.MAIL_PASSWORD }}
      
      subject: Github Actions job result
      to: obiwan@example.com,yoda@example.com
      
      from: Luke Skywalker # OR 'Luke Skywalker <user@example.com>'
      
      body: Build job of ${{ github.repository }} completed successfully!
```

> The parameters username and password are set as optional to support self-hosted runners access to on-premise infrastructure.
> 
> If you are accessing public email servers make sure you provide a username/password authentication through GitHub Secrets to make the email delivery secure.

{% endraw %}
