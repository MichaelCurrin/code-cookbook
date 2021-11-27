# List methods

List the methods available on an object.

In Python you can just do `dir(obj)` but in JS you need to write your own function.


From [How to list all methods of an object in JavaScript](https://flaviocopes.com/how-to-list-object-methods-javascript/) tutorial.


## Basic

This lists only the methods defined on that specific object, not any method defined in its prototype chain.

```javascript
function methods(obj) { 
  const properties = Object.getOwnPropertyNames(obj) 
  
  return properties.filter(item => typeof obj[item] === 'function')
}
```


## Chain

```javascript
function methods(obj) {
  let properties = new Set()
  let currentObj = obj
  
  do {
    Object.getOwnPropertyNames(currentObj)
      .map(item => properties.add(item))
  } while ((currentObj = Object.getPrototypeOf(currentObj)))
  
  const p = [...properties.keys()]
  
  return p.filter(item => typeof obj[item] === 'function')
}
```

Usage:

```javascript
methods("")
methods({})
methods(Date.prototype)
```

Sample output:

```javascript
methods('')
[
  'constructor',          'anchor',            'big',
  'blink',                'bold',              'charAt',
  'charCodeAt',           'codePointAt',       'concat',
  'endsWith',             'fontcolor',         'fontsize',
  'fixed',                'includes',          'indexOf',
  'italics',              'lastIndexOf',       'link',
  'localeCompare',        'match',             'matchAll',
  'normalize',            'padEnd',            'padStart',
  'repeat',               'replace',           'search',
  'slice',                'small',             'split',
  'strike',               'sub',               'substr',
  'substring',            'sup',               'startsWith',
  'toString',             'trim',              'trimStart',
  'trimLeft',             'trimEnd',           'trimRight',
  'toLocaleLowerCase',    'toLocaleUpperCase', 'toLowerCase',
  'toUpperCase',          'valueOf',           'replaceAll',
  '__defineGetter__',     '__defineSetter__',  'hasOwnProperty',
  '__lookupGetter__',     '__lookupSetter__',  'isPrototypeOf',
  'propertyIsEnumerable', 'toLocaleString'
]
```
