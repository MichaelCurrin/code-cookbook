# Auth0

{% raw %}

Integrate with auth0 service to allow user login and manage from the auth0 site.

This uses `auth0-react` NPM package.

- Auth0-React
    - [Homepage](https://auth0.github.io/auth0-react/) - there are some useful examples here.
    - [auth0/auth0-react](https://github.com/auth0/auth0-react) repo.
- Auth0
    - [Auth0 React SDK for Single Page Apps](https://auth0.com/docs/libraries/auth0-react) page on the Auth0 docs. There are some useful examples here.
    - [React: Login ](https://auth0.com/docs/quickstart/spa/react) tutorial in the Auth0 docs.
    

## Securing your data

Note that you can use React or vanilla JS to protect endpoints such that users cannot visit them unless they are logged in. 

From my research, this is for better user experience, so that you cannot land on a page unless you are signed in - you'll get redirected. Note that this is **not** intended to be secure. Someone could always download your client-side JS app and mess with the code then they can get to the protected endpoints. 

To secure your data, you need a backend (like Node Express API or Serverless API) which prevents users from accessing content unless they are authenticatd and have the necessary permissions to read or write data. 


## Samples

The one example I followed _also_ set `audience` as a parameter for `Auth0Provider`, using the app URL. But maybe this is not always needed as the basic example found doesn't use it.

### Basic

From the NPM package's docs.

Configure the SDK by wrapping your application (`App` object) in `Auth0Provider`

- `index.jsx`
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

### Login and logout

My example that I set up and tested.

Here using a frontend React setup, without Node. Note use of of `htm` library to get something close to JSX syntax.

- `index.html`
    ```html
    <head>
        <script defer type="module" src="main.js"> </script>
    </head>

    <body>
        <div id="app"></div>
    </body>
    ```
- `main.js`
    ```javascript
    import Auth0 from "https://dev.jspm.io/@auth0/auth0-react";
    import htm from "https://dev.jspm.io/htm@3.0";
    import ReactDOM from "https://dev.jspm.io/react-dom@17.0";
    import React from "https://dev.jspm.io/react@17.0";

    const { Auth0Provider, useAuth0 } = Auth0;

    const html = htm.bind(React.createElement);

    const DOMAIN = "dev-x1rgzxvi.us.auth0.com";
    const CLIENT_ID = "bzH1tzixL8W34435UoA67hjVhk3AieEd";
    const SCOPE = "read:shows";

    function LoginButton() {
      const { loginWithRedirect } = useAuth0();

      return html`<button onClick=${() => loginWithRedirect()}>Log In</button>`;
    }

    function LogoutButton() {
      const { logout } = useAuth0();

      return html`
        <button onClick=${() => logout({ returnTo: window.location.origin })}>
          Log Out
        </button>
      `;
    }

    function App() {
      const { isAuthenticated } = useAuth0;

      return html`
        <div>
          <h2>React Auth0 demo</h2>

          <${isAuthenticated ? LogoutButton : LoginButton} />
        </div>
      `;
    }

    ReactDOM.render(
      html`
        <${Auth0Provider}
          domain="${DOMAIN}"
          clientId="${CLIENT_ID}"
          scope="${SCOPE}"
          redirectUri=${window.location.origin}
        >
          <${App}/>
        </${Auth0Provider}>
      `,
      document.getElementById("app")
    );
    ```

Weirdly, the Auth0 objects cannot be unpacked in the import line as below, so you have to do it in two lines as above.

```javascript
import { Auth0Provider, useAuth0 } from "https://dev.jspm.io/@auth0/auth0-react";
// SyntaxError: import not found: useAuth0
```

### Call a protected API

From [Calling an API](https://auth0.com/docs/quickstart/spa/react/02-calling-an-api) in the docs.

> Once you configure Auth0Provider, you can easily get the access token using the getAccessTokenSilently() method from the useAuth0() custom React Hook wherever you need it.

Add `useEffect` hook to your component.

```jsx
useEffect(() => {
  const getUserMetadata = async () => {
    const domain = "YOUR_DOMAIN";

    try {
      const accessToken = await getAccessTokenSilently({
        audience: `https://${domain}/api/v2/`,
        scope: "read:current_user",
      });

      const userDetailsByIdUrl = `https://${domain}/api/v2/users/${user.sub}`;

      const metadataResponse = await fetch(userDetailsByIdUrl, {
        headers: {
          Authorization: `Bearer ${accessToken}`,
        },
      });

      const { user_metadata } = await metadataResponse.json();

      setUserMetadata(user_metadata);
    } catch (e) {
      console.log(e.message);
    }
  };

  getUserMetadata();
}, []);
```

{% endraw %}
