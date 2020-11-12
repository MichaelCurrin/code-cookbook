# Publish

See [semantic-release/semantic-release](https://github.com/semantic-release/semantic-release) and [docs](https://github.com/semantic-release/semantic-release/blob/master/docs/usage/configuration.md#repositoryurl).

> semantic-release automates the whole package release workflow including: determining the next version number, generating the release notes and publishing the package.


Based on workflow in [Presite](https://github.com/egoist/presite).

- `main.yml`
    ```yaml
    steps:
      - uses: actions/checkout@v2
      
      - name: Use Node.js ${{ matrix.node-version }}
        uses: actions/setup-node@v1
        with:
          node-version: ${{ matrix.node-version }}
          
      - run: npm install
      
      - run: npm test
      
      - run: npx semantic-release
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          NPM_TOKEN: ${{ secrets.NPM_TOKEN }}
    ```
