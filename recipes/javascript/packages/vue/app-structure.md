# App structure

See also [Semantic HTML]({{ site.baseurl }}{% link recipes/web/html/outlines/semantic-html.md %}) page, which is not specific to Vue but gives recommendations for modern semantic HTML elements to use.


## Basic without nav

Based on [App.vue](https://github.com/MichaelCurrin/vue-quickstart/blob/master/src/App.vue) of `vue-quickstart`, from the Vue CLI-generated app.

Here there is no navbar - just a one-page site.

```vue
<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png" />
    <HelloWorld msg="Vue.js Quickstart" />
  </div>
</template>
```


## Basic with nav

Based on the Vue 3 [Instruction](https://v3.vuejs.org/guide/introduction.html) tutorial, but using PascalCase, since the Vue CLI quickstart uses that. Also `AppNav` seems redundant when `Nav` will do.

See [Component Registration](https://v3.vuejs.org/guide/component-registration.html#component-names) for more info on naming.

The example using nav without mentioning Vue Router or anything.

```html
<div id="app">
  <Nav></Nav>
  <AppView>
    <Sidebar></Sidebar>
    <Content></content>
  </AppView>
</div>
```


## With Vue Router

Based on [App.vue](https://github.com/MichaelCurrin/badge-generator/blob/master/src/App.vue) of my Badge Generator, which uses Vue Router and that library's naming conventions.

```vue
<template>
  <div id="app">
    <div class="container-lg">
      <Nav></Nav>
    </div>

    <router-view />
  </div>
</template>
```

Where `Nav` is something like:

```vue
<template>
  <div id="nav">
    <span v-for="(item, index) in routes" v-bind:key="item.path">
      <router-link :to="item.path">{{ item.name }}</router-link>
    </span>
  </div>
</template>
```
