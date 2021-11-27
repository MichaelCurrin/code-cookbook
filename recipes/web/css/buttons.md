# Buttons

See [Best CSS Button Generator](https://www.bestcssbuttongenerator.com/)

Some useful styling - in particular for a DocsifyJS site.

```css
.myButton {
    background-color: var(--theme-color);
    color: white;
    
    /* Slightly larger */
    font-size: 1.0em;
    /* Round the edges */
    
    border-radius: 8px;
    padding: 6px 12px;
    
    /* Change cursor on hover */
    cursor: pointer;
}

.myButton:hover {
    filter: brightness(110%)
}

/* Shift the button down on click */
.myButton:active {
    position:relative;
    top: 2px;
}
```
