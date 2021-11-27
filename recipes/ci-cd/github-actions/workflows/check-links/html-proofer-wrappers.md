# HTML Proofer wrappers

A few actions which use the `html-proofer` gem.


## HTMLProofer

- [GH Marketplace](https://github.com/marketplace/actions/htmlproofer)

```yaml
- name: Check links
  uses: chabad360/htmlproofer@master
  with:
    directory: public
```

## Proof HTML

- [GH Marketplace](https://github.com/marketplace/actions/proof-html)

```yaml
- name: Check links
  uses: anishathalye/proof-html@v1
  with:
    directory: site
```
