---
logo: jekyll
---
# Jekyll
> How to run a Jekyll site in a container


```sh
export JEKYLL_VERSION=3.9
```

```sh
mkdir my-blog
cd my-blog
docker run --rm --volume="$PWD:/srv/jekyll" -it \
  jekyll/jekyll:$JEKYLL_VERSION jekyll new .
```
