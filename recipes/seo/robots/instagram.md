# Instagram robots

Here is a copy of the Instagram robots file which covers specific agents. The lines are mostly identical except for under GoogleBot. It is also possible to use less code and put more than one user-agent together on a line, but I think I read this is not widely supported.

- https://www.instagram.com/robots.txt

```
User-agent: Applebot
Disallow: /api/
Disallow: /publicapi/
Disallow: /query/
Disallow: /logging/
Disallow: /qp/batch_fetch_web/
Disallow: /client_error/
Disallow: /*__a=1*

User-agent: baiduspider
Disallow: /api/
Disallow: /publicapi/
Disallow: /query/
Disallow: /logging/
Disallow: /qp/batch_fetch_web/
Disallow: /client_error/
Disallow: /*__a=1*

User-agent: Bingbot
Disallow: /api/
Disallow: /publicapi/
Disallow: /query/
Disallow: /logging/
Disallow: /qp/batch_fetch_web/
Disallow: /client_error/
Disallow: /*__a=1*

User-agent: DuckDuckBot
Disallow: /api/
Disallow: /publicapi/
Disallow: /query/
Disallow: /logging/
Disallow: /qp/batch_fetch_web/
Disallow: /client_error/
Disallow: /*__a=1*

User-agent: Googlebot
Disallow: /api/
Disallow: /publicapi/
Disallow: /query/
Disallow: /logging/
Disallow: /qp/batch_fetch_web/
Disallow: /client_error/
Disallow: /*__a=1*
Allow: /api/v1/guides/guide/

...

User-agent: Yeti
Disallow: /api/
Disallow: /publicapi/
Disallow: /query/
Disallow: /logging/
Disallow: /qp/batch_fetch_web/
Disallow: /client_error/
Disallow: /*__a=1*

User-agent: *
Disallow: /
```
