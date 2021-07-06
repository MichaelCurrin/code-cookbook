---
title: JSON
description: Handle outputting of JSON data
---

See also my gist - [Build a REST API with Jekyll](https://gist.github.com/MichaelCurrin/f8d908596276bdbb2044f04c352cb7c7).

{% raw %}
                                                  
## Samples
          
You can use `.html` or `.liquid` extension if you prefer.

Call like:

- `api/foo.json`
    ```liquid
    ---
    layout: null
    ---
    {% include to_json.json data=site.data.foo %}
    ```
          
### Simple

Keys and values.

- `_include to_json.json` plain
    ```liquid                                                                                                    
    {{ include.data | jsonify }}
    ```
- `_include to_json.json` with a key.
    ```liquid                                                                                                    
    { "data": {{ include.data | jsonify }} }
    ```
          
### Values only
                                                  
Iterate over a hash and use the values only, ignoring the keys.                                                  
      
- `_include to_json.json`
    ```liquid                                                                                                    
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
    ```
                                                  
{% endraw %}
