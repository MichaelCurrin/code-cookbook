# Wait for element

There are a few ways to do this.

See [question] on StackOverflow.

[question]: https://stackoverflow.com/questions/15875128/is-there-element-rendered-event


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
