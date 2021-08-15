---
---
# Sitemaps

## Basic

What is a sitemap and do you need one?

A sitemap is usually machine-readable file such as `/sitemap.xml`. You also get user-facing pages like `/site-map.html` and this may be paginated or have a breakdown of categories, but the focus of this guide is on the XML one.

This is for crawlers to identify pages on your site to crawl. The sitemap can be discovered by crawlers and you can also put it as a line in your [robots](/recipes/robots) file to be sure. If you have multiple sitemaps, you can also list those in the robots file so that crawlers can find hem all.

- [Learn about sitemaps](https://support.google.com/webmasters/answer/156184?hl=en)


### Sitemap formats

Based on [resource](https://support.google.com/webmasters/answer/183668?hl=en).

- XML
- RSS, mRSS, and Atom 1.0
- Text
- Google sites


## How to

### Build

https://support.google.com/webmasters/answer/183668?hl=en

Build and submit a sitemap:

1. Decide which pages on your site should be crawled by Google, and determine the canonical version of each page.
1. Decide which sitemap format you want to use. You can create your sitemap manually or choose from a number of third-party tools to generate your sitemap for you.
1. Make your sitemap available to Google by adding it to your robots.txt file or directly submitting it to Search Console.

See sitemap generator tool:

- [xml-sitemaps.com](https://www.xml-sitemaps.com/)

### General guidelines

See *General sitemap guidelines* section here.

https://support.google.com/webmasters/answer/183668?hl=en



### Languages

See [Tell Google about localized versions of your page](https://support.google.com/webmasters/answer/189077#sitemap).


## Sitemaps protocol

See the [Protocol](https://www.sitemaps.org/protocol.html) page of the official [sitemaps.org](https://www.sitemaps.org) site.

### Fields

- `loc` - e.g.  `http://www.example.com/`, `http://www.example.com/catalog?item=12&amp;desc=vacation_hawaii`
- `lastmod` - e.g. `2020-03-04`
- `changefreq`  - e.g. `monthly`

Priority is dropped from the examples.

> Google does not currently consume the `<priority>` attribute in sitemaps. [source](https://support.google.com/webmasters/answer/183668?hl=en)
