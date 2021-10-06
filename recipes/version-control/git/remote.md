# Remote

Dealing with remotes in Git.


## Related

- [Remotes(https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/version-control/git/remote.html) in Dev Cheatsheets.


## View

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



## Add remote to a new repo

When you set up a repo like this, you won't have any remotes.

```sh
$ git init
```

This should give nothing.

```sh
$ git remote -v
```

Add a remote.

```sh
$ git remote add origin git@github.com:MichaelCurrin/dev-cheatsheets.git
```

You can commit and push now.

You need to include the remote name and branch the first time you pull. Note you'll get an error doing a pull on an empty remote.

```sh
$ git pull origin master
```

Then just:

```sh
$ git pull
```

Note that if you use VS Code to push, it will create the repo for you on GitHub without having to go through the GitHub UI.

### Add remote for a fork

Given you have forked a repo and cloned it and it has this remote setup:

- `origin git@github.com:MyUsername/dev-cheatsheets.git`

And the the original repo is at `MichaelCurrin/dev-cheatsheets`.

So to pull in changes from the original repo into your fork, you can do this. The name `upstream` is a common name to use.

```sh
$ git remote add upstream git@github.com:MichaelCurrin/dev-cheatsheets.git
```

```sh
$ git checkout master
```

```sh
$ git pull upstream master
$ # Or
$ git reset --hard upstream master
```

Push your local commits to your fork.

```sh
$ git push
```

That implies:

```sh
$ git push origin master
```


## Sync a fork

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
