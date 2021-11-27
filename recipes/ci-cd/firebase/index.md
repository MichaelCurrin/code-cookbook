# Firebase

## Set up Firebase hosting

Log in to the [console](https://console.firebase.google.com) for help and to create or select a project.

### 1. Install the CLI

```sh
$ npm install -g firebase-tools
```

### 2. Initialize

```sh
$ firebase login
```
```sh
$ firebase init
```

### 3. Deploy

Put your static files in your app's deploy directory (the default is `public`). 

Then run this command from your app’s root directory:

```sh
$ firebase deploy
```

Then view your site at the URL shown in the console.


## Demo app

Linked from the Firebase console.

- Default URL [fir-demo-project.web.app/](https://fir-demo-project.web.app/)
- Default URL [fir-demo-project.firebaseapp.com](https://fir-demo-project.firebaseapp.com/)
- Custom URL [flood-it.app](https://flood-it.app/)
