# Jekyll


From [Just the Docs](https://github.com/pmarsceill/just-the-docs/blob/master/docker-compose.yml)

```yaml
version: "3.5"

services:
  jekyll:
    build:
      context: ./
    ports:
      - 4000:4000
    volumes:
      - .:/usr/src/app
    stdin_open: true
    tty: true
    command: bundle exec jekyll serve -H 0.0.0.0 -t
```
