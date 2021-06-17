---
title: send email action
description: Send an email with GH Actions
---

{% raw %}

[Marketplace](https://github.com/marketplace/actions/send-email-action) link.


## Sample

Based on the docs.

```yaml
- name: Send email
    uses: AlexisMateo/sendmail-action@5
    with:
      smtp-server: ${{ secrets.SMTP_SERVER }}
      smtp-server-port: ${{ secrets.SMTP_SERVER_PORT }}
      
      auth-user: ${{ secrets.AUTH_USER }}
      auth-password: ${{secrets.EMAIL_PASSWORD }}
      
      subject: correciones a ${{github.repository}}
      body: ${{github.context.payload}}
      
      from: ${{ secrets.EMAIL_FROM }}
      to: ${{ secrets.EMAIL_RECIVER }}
      
      is-tls: false
      commit-message: true
```

{% endraw %}
