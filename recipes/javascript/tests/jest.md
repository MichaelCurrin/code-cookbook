# Jest
> How to add Jest to your Node.js project

See [Jest](https://jestjs.io/) homepage.

Use the following pattern for placing naming your test scripts, so Jest can find them,.

- Scripts `tests/unit` that end in `.spec.(js|jsx|ts|tsx)`. e.g. `src/tests/unit/foo.spec.js`.
- Any js(x)/ts(x) files inside `__tests__` directories. e.g. `src/__tests__/foo.test.js`.



## Sample

Install with:

```sh
$ npm install jest -D
```

- `package.json`.
    ```json
    {
      "scripts": {
        "test": "jest"
      },
      "devDependencies": {
        "jest": "^26.0.1"
      }
    }
    ```
- `src/foo.js`
    ```javascript
    function square(value) {
      return value**2;    
    }
    
    module.exports = {
      foo
    }
    ```
- `src/__tests__/foo.test.js`
    ```javascript
    const { foo } = require('../foo.js')
    
    test('Square a number successfully', () => {
      expect(foo(3)).toBe(9)
    })
    ```

Then run as:

```sh
$ npm test
```

You can also generate a Jest config:

```sh
$ jest --init
```
