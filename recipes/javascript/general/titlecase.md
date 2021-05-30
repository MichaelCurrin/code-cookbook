# Titlecase

This is no titlecase method in JS like in other languages. 

This fills that gap, but, only cares about the first letter, ignoring multiple words.

This also does not care about downcasing which may already be uppercase.


## Code

In TypeScript.

```typescript
/**
 * Convert to titlecase.
 *
 * i.e. Make first letter of a string uppercase and return the new string.
 */
export function title(value: string) {
  if (!value.length) {
    throw new Error("Cannot have empty string for applying title");
  }
  return `${value[0].toUpperCase()}${value.substring(1)}`;
}
```


## Test

```typescript
describe("#title", function () {
it("converts to titlecase correctly", function () {
  assert.strictEqual(title("h"), "H");

  assert.strictEqual(title("hello"), "Hello");
});

it("doesn't downcase uppercase letters", function () {
  assert.strictEqual(title("Hello"), "Hello");

  assert.strictEqual(title("hELLo"), "HELLo");
});

it("disallows empty string input", function () {
  assert.throws(() => title(""));
});
});
```
