# GitHub Pages

Deploy manually.

Assuming `build` is your output. And you want to push to the root of the `gh-pages` branch.

This set up to work in a `Makefile`.

```sh
deploy:
	git worktree add /tmp/build gh-pages

	rm -rf /tmp/build/*
	cp -rp build/* /tmp/build/

	cd /tmp/book \
		&& git add -A \
		&& git commit -m "Deployed on $(shell date) by ${USER}" \
		git push origin gh-pages
```

Copied from [guide](https://rust-lang.github.io/mdBook/continuous-integration.html).
