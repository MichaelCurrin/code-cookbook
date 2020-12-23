---
title: Jekyll and make
---

See also the `Makefile` files in my Jekyll projects such as the [Coding Blog repo's Makefile](https://github.com/MichaelCurrin/coding-blog/blob/master/Makefile).

- `Makefile`
	```mk
	install:
		bundle config set path local 'vendor/bundle'
		bundle install

	upgrade:
		bundle update

	s serve:
		bundle exec jekyll serve --trace --livereload
	```
