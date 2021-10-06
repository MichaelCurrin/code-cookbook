# Remote

Dealing with remotes.


## Origin

The name `origin` is the remote and the name `origin` is the default or convention.

After you clone, you can see your remote.

```console
$ git remote
origin
```

And you can see what it points to. You might use GitHub or BitBucket here.

```console
$ git remote -v
origin  git@github.com:MichaelCurrin/foo.git (fetch)
origin  git@github.com:MichaelCurrin/foor.git (push)
```

I guess you could make the fetch and push different but never had to do that.


## Syncing a fork

If you are working on a fork, it is useful to have two remotes. 

- One for "origin" for your fork. 
- And one named "upstream" to reference to the original repo.

Add the upstream remote:

```sh
$ git remote add upstream git@github.com:abc/def.git
```

View remotes

```sh
$ git remote
upstream
origin
```

See the URLS with verbose

```sh
$ git remote -v
# original repo
upstream    git@github.com:abc/def.git (fetch)
upstream    git@github.com:abc/def.git (push)
# my fork
origin  git@github.com:MichaelCurrin/def.git (fetch)
origin  git@github.com:MichaelCurrin/def.git (push)
```


Your push and pull operations will use origin by default. The implied values are commented out.

```sh
$ git checkout master
$ git pull # origin master

$ git checkout my-feat
$ git pull # origin my-feat

$ git push # origin my-feat
```

And now you can pull the original repo into your fork!

```sh
$ git checkout master
$ git pull # origin master
$ git pull upstream master
$ git push # origin master
```
