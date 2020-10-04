---
layout: listing
---
# Robots file
> Recipes for robots.txt - a file for search crawlers to read

A `/robots.txt` file your domain gives directives for SEO crawlers like GoogleBot on how to crawl your site. Crawlers can be requested to ignore the `/admin` path or the entire domain for example. Note that directives are suggestions and do not have to be obeyed by crawlers.


## General-purpose

A simple file to allow the entire site to be crawled - no rules to ignore private pages or crawlers.

```
User-agent: *
Disallow:
```

For more info: https://www.robotstxt.org/robotstxt.html
