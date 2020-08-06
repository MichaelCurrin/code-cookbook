# Skip
> How to skip a GH Actions CI build

Add a condition to skip if the commit message containts the phrase `[ci skip]`.

```yaml
jobs:
  deploy_docs:
    if: "!contains(github.event.commits[0].message, '[ci skip]')"
   
    steps:
      # ...
```
