# Events 

A list of events that changes on page load and shows only events on or after today, i.e. no past events.

This assumes you have a collection called `events` and each Markdown page there has a title and a datetime.

{% raw %}

```liquid
<ul id="list"></ul>

<script>
let eventData = {
  {% for e in site.events %}
    { title: {{ e.title }}, datetime: {{ e.datetime }} },
  {% endfor %}
}

// e.g. 2021-11-02 13:45
const today = new Date();

// e.g. 2021-11-02 0:00
today.setUTCHours(0, 0, 0, 0);

// Restrict events list to only events on or after midnight of today. 
evenrData = eventData.filter(event => new Date(event.datetime) >= today);

const list = document.getElementById("list")

for (const e of eventData) {
  const li = document.createElement('li');
  li.innerHTML = `<b>${e.datetime}</b> ${show.title}`;
  ul.appendChild(li);
}
</script>
```

{% endraw %}
