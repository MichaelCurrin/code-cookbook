# Submodules


```Makefile
sm-setup:
	git submodule init
	git submodule update

sm-reset:
	git submodule update --force

wp-pull:
	git submodule update --remote
	git status my-submodule --short

sm-commit:
	git commit my-submodule 
```
