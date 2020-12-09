# Scraping

I recommend using `scrapy`, a high-level Python package for scraping websites and saving the output as files.

See [docs.scrapy.org](https://docs.scrapy.org/).

## Spidering

Use scrapy to discover pages on a site.


### Basic

From the [Spiders](https://docs.scrapy.org/en/latest/topics/spiders.html) docs page.

```python
import scrapy


class MySpider(scrapy.Spider):
    name = 'example.com'
    allowed_domains = ['example.com']
    start_urls = [
        'http://www.example.com/1.html',
        'http://www.example.com/2.html',
        'http://www.example.com/3.html',
    ]

    def parse(self, response):
        self.logger.info('A response from %s just arrived!', response.url)
```

### Scrape nested sitemaps

Example from the [SitemapSpider](https://docs.scrapy.org/en/latest/topics/spiders.html#sitemapspider) part of the docs.

```python
from scrapy.spiders import SitemapSpider

class MySpider(SitemapSpider):
    sitemap_urls = ['http://www.example.com/sitemap.xml']

    def parse(self, response):
        pass # ... scrape item here ...
```
