# Cache
> Cache artifacts like dependencies and build outputs to improve workflow execution time

https://github.com/marketplace/actions/cache

```yaml
- name: Cache
  uses: actions/cache@v2.0.0
  with:
    # A list of files, directories, and wildcard patterns to cache and restore
    path:
    # An explicit key for restoring and saving the cache
    key:
    # An ordered list of keys to use for restoring the cache if no cache hit occurred for key
    restore-keys: # optional
```
