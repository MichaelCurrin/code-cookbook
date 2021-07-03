# Auth0

{% raw %}

Integrate with auth0 service to allow user login and manage from the auth0 site.

This uses `auth0-react` NPM package.

- [Homepage](https://auth0.github.io/auth0-react/)
- [auth0/auth0-react](https://github.com/auth0/auth0-react) repo.
- [Auth0 React SDK for Single Page Apps](https://auth0.com/docs/libraries/auth0-react) page on the Auth0 docs.


## Hiding data

Note that you can use React or vanilla JS to protect endpoints such that users cannot visit them unless they are logged in. 

From my research, this is for better user experience, so that you cannot land on a page unless you are signed in - you'll get redirected. Note that this is **not** intended to be secure. Someone could always download your client-side JS app and mess with the code then they can get to the protected endpoints. 

To secure your data, you need a backend (like Node Express API or Serverless API) which prevents users from accessing content unless they are authenticatd and have the necessary permissions to read or write data. 


## Samples

### Basic

From the NPM package's docs. There are some other useful examples there.

Configure the SDK by wrapping your application (`App`) in `Auth0Provider`

```jsx
import React from 'react';
import ReactDOM from 'react-dom';
import { Auth0Provider } from '@auth0/auth0-react';
import App from './App';

ReactDOM.render(
  <Auth0Provider
    domain="YOUR_AUTH0_DOMAIN"
    clientId="YOUR_AUTH0_CLIENT_ID"
    redirectUri={window.location.origin}
  >
    <App />
  </Auth0Provider>,
  document.getElementById('app')
);
```


{% endraw %}
