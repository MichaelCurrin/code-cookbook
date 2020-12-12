# Jest
> How to add Jest to your Node.js project

See [Jest](https://jestjs.io/) homepage.


Test scripts should be named `*.spec.js`. You can also use `.jsx`, `.ts` or `.tsx` for the extension.

They can exist next to the script it is testing, or put all your tests in `__tests__`.


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
