# Multiple containers

## Sample

## Strucure

Say you have this setup for two containers in a repo:

- `backend/`
    - `Dockerfile`
    - `index.js`
- `nginx/`
    - `Dockerfile`
    - `index.js`
- `.env`
- `common.yml`
- `docker-compose.yml`

### Configs

Here is the content to tie the containers together:

- `common.yml`
    ```yaml
    version: '2'

    services:
      base:
        build: .
        volumes:
          - "backend:/usr/src/server"
    ```
- `docker-compose.yml`
    ```yaml
    version: "2"

    services:
      backend:
        extends:
          file: common.yml
          service: base
        build:
          context: backend
          dockerfile: Dockerfile
        env_file: .env
        ports:
          - "127.0.0.1:5000:5000"
        command: npm run start

      nginx:
        extends:
          file: common.yml
          service: base
        build:
          context: nginx
          dockerfile: Dockerfile
        ports:
          - "80:80"
        links:
          - backend:backend
        env_file: .env
    ```
