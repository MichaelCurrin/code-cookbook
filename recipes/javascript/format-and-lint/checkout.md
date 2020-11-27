# Configs

Sample files for ESLint (linting), Prettier (formatting), Jest (tests) and TypeScript.


## The Checkout repo

From [actions/checkout](https://github.com/actions/checkout) - a TypeScript project.

- `.eslintignore` and `.prettierignore` (same content in both)
	```
	dist/
	lib/
	node_modules/
	```
- `.eslintrc.json`
	```json5
	{
	  "plugins": ["jest", "@typescript-eslint"],
	  "extends": ["plugin:github/es6"],
	  "parser": "@typescript-eslint/parser",
	  "parserOptions": {
		"ecmaVersion": 9,
		"sourceType": "module",
		"project": "./tsconfig.json"
	  },
	  "rules": {
		"eslint-comments/no-use": "off",
		"import/no-namespace": "off",
		"no-unused-vars": "off",
		"@typescript-eslint/no-unused-vars": "error",
		
		// ...
		
		"@typescript-eslint/restrict-plus-operands": "error",
		"semi": "off",
		"@typescript-eslint/semi": ["error", "never"],
		"@typescript-eslint/type-annotation-spacing": "error",
		"@typescript-eslint/unbound-method": "error"
	  },
	  "env": {
		"node": true,
		"es6": true,
		"jest/globals": true
	  }
	}
	```
- `.prettierrc.json`
	```json
	{
	  "printWidth": 80,
	  "tabWidth": 2,
	  "useTabs": false,
	  "semi": false,
	  "singleQuote": true,
	  "trailingComma": "none",
	  "bracketSpacing": false,
	  "arrowParens": "avoid",
	  "parser": "typescript"
	}
	```
- `jest.config.js`
	```javascript
	module.exports = {
	  clearMocks: true,
	  moduleFileExtensions: ['js', 'ts'],
	  testEnvironment: 'node',
	  testMatch: ['**/*.test.ts'],
	  testRunner: 'jest-circus/runner',
	  transform: {
		'^.+\\.ts$': 'ts-jest'
	  },
	  verbose: true
	}
	```
- `tsconfig.json`
	```json
	{
	  "compilerOptions": {
		"target": "es6",
		"module": "commonjs",
		"lib": [
		  "es6"
		],
		"outDir": "./lib",
		"rootDir": "./src",
		"declaration": true,
		"strict": true,
		"noImplicitAny": false,
		"esModuleInterop": true
	  },
	  "exclude": ["__test__", "lib", "node_modules"]
	}
	```
	
