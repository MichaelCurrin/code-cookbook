# Components

[Showcase](https://www.primefaces.org/primevue/showcase/)

## Samples

### Button

Some info from the [Button](https://www.primefaces.org/primevue/showcase/#/button) showcase.

```javascript
import Button from 'primevue/button';
```

Basic:

```html
<Button label="Submit" />
```

Icons:

```html
<Button label="Submit" icon="pi pi-check" iconPos="right" />
```

Events:

```html
<Button label="Submit" @click="handleClick($event)"/>
```

Labels:

```html
<Button label="Primary" />
<Button label="Secondary" class="p-button-secondary" />
```
