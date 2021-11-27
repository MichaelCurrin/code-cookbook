# Wait for element

There are a few ways to do this.

See [question] on StackOverflow.

[question]: https://stackoverflow.com/questions/15875128/is-there-element-rendered-event

The examples here wait for a node to be rendered and then do something do it like append an element to it.


## Using animation frame

Listen for repaints triggers, when the visible portion of the screen changes. This could be because of the elements added or update as nodes, or CSS changes like visiblity changes or color.

- [requestAnimationFrame](https://developer.mozilla.org/en-US/docs/Web/API/window/requestAnimationFrame)

Using a recursive function. It runs initially and then afterwards it calls `requestAnimationFrame` repeatedly, checking if element is ready otherwise waiting again.

```javascript
function onElementReady(el) {
  return new Promise(resolve => {
    const waitForElement = () => {
      if (el) {
        resolve(el);
      } else {
        window.requestAnimationFrame(waitForElement);
      }
    };
    
    waitForElement();
  })
)
```

As recommended in [post](http://swizec.com/blog/how-to-properly-wait-for-dom-elements-to-show-up-in-modern-browsers/swizec/6663).

```javascript
function wait() {
    if (!$("#element").size()) {
        window.requestAnimationFrame(wait);
    } else {
        $("#element").doStuff();
    }
};
```

> in practice it only ever retries once. Because no matter what, by the next render frame, whether it comes in a 60th of a second, or a minute, the element will have been rendered.


 
## MutationObserver approach

Listen for changes in the DOM, such as element added.

- [MutationObserver](https://developer.mozilla.org/en-US/docs/Web/API/MutationObserver)

From 2018, this is built-in for the browser. Not available in Node.

```javascript
// Options for the observer (which mutations to observe)
const config = { 
  attributes: true, 
  childList: true, 
  subtree: true
};

const callback = function(mutationsList, observer) {
    for (const mutation of mutationsList) {
        if (mutation.type === 'childList') {
            console.log('A child node has been added or removed.');
        }
        else if (mutation.type === 'attributes') {
            console.log('The ' + mutation.attributeName + ' attribute was modified.');
        }
    }
};

const observer = new MutationObserver(callback);

const targetNode = document.getElementById('some-id');
// Start observing the target node for configured mutations.
observer.observe(targetNode, config);

// Later, you can stop observing
observer.disconnect();
```

Or this. Wait for body to be ready and then add an elemen to it.

```javascript
const config = {attributes: false, childList: true, characterData: false, subtree:true}

function callback(mutations) {
   if (document.contains(myElement)) {
        console.log("It's in the DOM!");
        observer.disconnect();
    }
}

// Or define and us inline.
const observer = new MutationObserver(callback);

const myElement = $("<div>hello world</div>")[0];

observer.observe(document, config);

$("body").append(myElement);
```


## ResizeObserver

In one case, solutions like setTimeout or MutationObserver weren't totally realiable.

- [ResizeObserver](https://developer.mozilla.org/en-US/docs/Web/API/ResizeObserver)
    > Implementations should, if they follow the specification, invoke resize events before paint and after layout.

Te observer always fires after layout, thus we should be able to get the correct dimensions of the observed element. 

As a bonus the observer already returns the dimensions of the element. Therefore we don't even need to call something like `offsetWidth` (even though it should work too).

```javascript
const resizeObserver = new ResizeObserver(entries => {
  const lastEntry = entries.pop();

  // alternatively use contentBoxSize here
  const width = lastEntry.borderBoxSize.inlineSize;
  const height = lastEntry.borderBoxSize.blockSize;

  resizeObserver.disconnect();

  console.log("width:", width, "height:", height);
});

const myElement = document.createElement("div");
myElement.textContent = "test string";

resizeObserver.observe(myElement);

document.body.append(myElement);
```
