# Profile

Code snippets to add to your GitHub profile or website to display your Github activity.

See also:

- [MichaelCurrin/MichaelCurrin](https://github.com/MichaelCurrin/MichaelCurrin)


## Commit graph

{% assign username = "MichaelCurrin" %}

{% capture graph %}
<img width="50%" src="https://activity-graph.herokuapp.com/graph?username={{ username }}&theme=github&hide_border=true"/> -->

<img height="200em" src="https://activity-graph.herokuapp.com/graph?username={{ username }}&hide_border=true&theme=dracula" />
{% endcapture %}

Code:

```html
{{ graph }}
```

Result:

{{ graph  }}

