# HTML proofer

This a Ruby solution for checking broken links.

You can run this on any directory of static HTML files and do it locally or in CI.

The example here is targeted as a Jekyll site and is based on this [blog posts](https://clementbm.github.io/github%20action/jekyll/link%20checking/2020/05/31/automatically-validate-links-on-jekyll-website.html).


## Shell commands 

```sh
$ bundle exec jekyll build
$ bundle exec htmlproofer _site
```
