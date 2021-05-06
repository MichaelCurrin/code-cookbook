# Components

See [Showcase](https://www.primefaces.org/primevue/showcase/) in the docs for components.


## Samples

### Button

Some info from the [Button](https://www.primefaces.org/primevue/showcase/#/button) showcase.

```javascript
import Button from 'primevue/button';
```

#### Basic

```html
<Button label="Submit" />
```

Result in the DOM:

```html
<button type="button" class="p-button p-component">
  <span class="p-button-label">Submit</span>
</button>
```

#### Icons

Add checkbox.

```html
<Button label="Submit" icon="pi pi-check" iconPos="right" />
```

Result in the DOM:

```html
<button type="button" class="p-button p-component" iconpos="right">
    <span class="pi pi-check p-button-icon p-button-icon-left"></span>
    <span class="p-button-label">Submit</span>
</button>
```

#### Events

```html
<Button label="Submit" @click="handleClick($event)"/>
```

#### Labels

```html
<Button label="Primary" />
<Button label="Secondary" class="p-button-secondary" />
```
