# Netlify
> How to setup a Netlify build

I like using [netlify.com](https://netlify.com) to build and host many of my websites. If you aren't familiar, sign up for a free account and hook up one of your GitHub repos to deploy it.

It works well if you have a static site like made with Hugo or Jekyll, or a web app like React or Vue.


## Configs

See the [configs](configs.md) page for how to configure a Netlify build.


## Netlify vs GH Actions

I like Netlify particularly becuause the setup is very light. You just need a package file like `Gemfile` or `package.json` and a one line build command and Netlify will build and serve your site for you on `my-app.netlify.app`. 

You don't have have to setup a GH Actions workflow file of steps or choose any actions or setup a token to actually push to a branch which serves on GH Pages.

You don't have to worry about tokens in Netlify either - GH Actions typically needs a token so it can commit to a branch for your and use that to serve a site.
