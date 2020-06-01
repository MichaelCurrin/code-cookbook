# Basic

From the tutorial https://pythonhosted.org/Genshi/templates.html .

> A Genshi markup template is a well-formed XML document with embedded Python used for control flow and variable substitution. Markup templates should be used to generate any kind of HTML or XML output, as they provide a number of advantages over simple text-based templates (such as automatic escaping of variable data).

```
<?python
  title = "A Genshi Template"
  fruits = ["apple", "orange", "kiwi"]
?>
<html xmlns:py="http://genshi.edgewall.org/">
  <head>
    <title py:content="title">This is replaced.</title>
  </head>

  <body>
    <p>These are some of my favorite fruits:</p>
    <ul>
      <li py:for="fruit in fruits">
        I like ${fruit}s
      </li>
    </ul>
  </body>
</html>
```

> This example shows:
> 
> - a Python code block in a processing instruction
> - the Genshi namespace declaration
> - usage of templates directives (py:content and py:for)
> - an inline Python expression (`${fruit}`).

Output

```html
<html>
  <head>
    <title>A Genshi Template</title>
  </head>

  <body>
    <p>These are some of my favorite fruits:</p>
    <ul>
      <li>I like apples</li>
      <li>I like oranges</li>
      <li>I like kiwis</li>
    </ul>
  </body>
</html>
```


Or a plain-text template.

```
Dear $name,

These are some of my favorite fruits:
#for fruit in fruits
 * $fruit
#end
```
