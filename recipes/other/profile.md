# Profile

Code snippets to add to your GitHub profile or website to display your Github activity.

See also:

- [MichaelCurrin/MichaelCurrin](https://github.com/MichaelCurrin/MichaelCurrin) - my GH profile with a couple of graphs on it.

## Services

- [anuraghazra/github-readme-stats](https://github.com/anuraghazra/github-readme-stats)
- [activity-graph.herokuapp.com/graph](https://activity-graph.herokuapp.com/graph)


## Commit graph

This is like the grid that appears on your standard GH profile, except this is for a shorter time and as a line and not grid.

I also feel like a graph of columns for each month or year would be nice and I've worked on that before but don't know if this service supports that.

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

