---
title: p5.js
description: A JS library for making art
---


## Resources

[Homepage](https://p5js.org/)

> p5.js is a JavaScript library for creative coding, with a focus on making coding accessible and inclusive for artists, designers, educators, beginners, and anyone else! p5.js is free and open-source because we believe software, and the tools to learn it, should be accessible to everyone.

You can play in the online sandbox here:

- [p5.js Editor](https://editor.p5js.org/)

See [Libraries](https://p5js.org/libraries/) page to see what is available for using p5 to make sound, music sequencing, an Arduinio GUI and more.

See [Examples](https://p5js.org/examples/) page for demo apps which cover basic shapes, forces, audio, inputs, 3D and more.


## Import

Load from CDN.

```html
<script src="https://cdn.jsdelivr.net/npm/p5@1.3.1/lib/p5.js"></script>
```

Load using package installed with NPM.

```html
<script src="../p5.min.js"></script>
```


## Samples

From [Get started](https://p5js.org/get-started/).

### Elipse

```javascript
function setup() {
  createCanvas(400, 400);
}

function draw() {
  background(220);
  ellipse(50,50,80,80);
}
```

### Follow cursor

```javascript
function setup() {
  createCanvas(400, 400);
}

function draw() {
  if (mouseIsPressed) {
    fill(0);
  } else {
    fill(255);
  }
  ellipse(mouseX, mouseY, 80, 80);
}
```
