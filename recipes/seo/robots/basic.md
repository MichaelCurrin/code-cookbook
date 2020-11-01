# Basic

A simple file to allow the entire site to be crawled - no rules to ignore private pages or crawlers.

```
User-agent: *
Disallow:
```

To block on a path:

```
Disallow: /admin
```


Or the entire site:

```
Disallow: /
```


For more info: [Robots](https://www.robotstxt.org/robotstxt.html) guide on the _robotstxt.org_ homepage.
