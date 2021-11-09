---
title: Config files
description: Sample Dockerfile and docker-compose files
---

## Dockerfile

`Dockerfile`

```docker
FROM ubuntu
```
    
    
## Docker compose

- `docker-compose.yml`
    ```yaml
    webapp:
      image: examples/web
      ports:
        - "8000:8000"
      volumes:
        - "/data"
    ```
- `docker-compose.yml`
    ```yaml
    webapp:
      build: .
      environment:
        - DEBUG=1
    ```
- `docker-compose.yml`
    ```yaml
    version: "3.8"

    services:
      foo:
        build: .
        volumes:
          - bar
    ```
