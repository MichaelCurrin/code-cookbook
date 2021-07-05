---
title: JSON
description: Handle outputting of JSON data
---

See also my gist - [Build a REST API with Jekyll](https://gist.github.com/MichaelCurrin/f8d908596276bdbb2044f04c352cb7c7).

{% raw %}
                                                  
## Samples
                                                  
### Values only
                                                  
Iterate over a hash and use the values only, ignoring the keys.                                                  
      
                                                                                                    
{
    "data": [
        {%- for row in include.data %}
            [
                {%- for field in row %}
                    {{- field[1] | jsonify -}} {%- unless forloop.last %},{% endunless -%}
                {% endfor -%}
            ] {%- unless forloop.last %},{% endunless -%}
        {% endfor -%}
    ]
}

                                                  
{% endraw %
