# Profile

Code snippets to add to your GitHub profile or website to display your Github activity.

See also:

- [MichaelCurrin/MichaelCurrin](https://github.com/MichaelCurrin/MichaelCurrin) - my GH profile with a couple of graphs on it.

## Services

- [anuraghazra/github-readme-stats](https://github.com/anuraghazra/github-readme-stats)
- https://activity-graph.herokuapp.com/graph

## Commit graph

{% assign username = "MichaelCurrin" %}

{% capture graph %}
<img width="50%" src="https://activity-graph.herokuapp.com/graph?username={{ username }}&theme=github&hide_border=true"/>

<img height="200em" src="https://activity-graph.herokuapp.com/graph?username={{ username }}&hide_border=true&theme=dracula" />
{% endcapture %}

Code:

```html
{{ graph }}
```

Result:

{{ graph  }}

