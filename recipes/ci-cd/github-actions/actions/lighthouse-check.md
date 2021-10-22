# Lighthouse check

{% raw %}


## Generic

Using 

- [@lhci/cli](https://www.npmjs.com/package/@lhci/cli) NPM package.
- [GoogleChrome/lighthouse-ci](https://github.com/GoogleChrome/lighthouse-ci)
    > Automate running Lighthouse for every commit, viewing the changes, and preventing regressions

Sample config. Node setup is optional if you want to use the default Node version in the environment.

- `ci.yml` from  docs.
    ```yaml
    name: CI

    on:
      - push

    jobs:
      lighthouse-ci:
        runs-on: ubuntu-latest

        steps:
          - name: Checkout
            uses: actions/checkout@v2

          - uses: actions/setup-node@v1
            with:
              node-version: 14

          - run: npm install
          - run: npm install -g @lhci/cli@0.8.x
          - run: npm run build
          - run: lhci autorun
    ```
    
Using `npx`.
 
- `ci.yml`
    ```yaml
    steps:
      # ...
        
      - name: Lighthouse check
        run: npx --package=@lhci/cli lhci autorun
        env:
            LHCI_GITHUB_APP_TOKEN: ${{ secrets.LHCI_GITHUB_APP_TOKEN }}
    ```


## Lighout Check action

[lighthouse-check](https://github.com/marketplace/actions/lighthouse-check) in the Marketplace.

### Samples

#### Basic

From the docs.

> In the below example we run Lighthouse on two URLs, log scores, save the HTML reports as artifacts, upload reports to AWS S3, notify via Slack with details about the change from Git data. By specifying the `pull_request` trigger and `accessToken` - we allow automatic comments of audits on the corresponding PR from the token user.

- `main.yml`
    ```yaml
    name: Test Lighthouse Check
    
    on: [pull_request]

    jobs:
      lighthouse-check:
        runs-on: ubuntu-latest
        
        steps:
          - uses: actions/checkout@master
          
          - run: mkdir /tmp/artifacts
          
          - name: Run Lighthouse
            uses: foo-software/lighthouse-check-action@master
            with:
              accessToken: ${{ secrets.LIGHTHOUSE_CHECK_GITHUB_ACCESS_TOKEN }}
              author: ${{ github.actor }}
              awsAccessKeyId: ${{ secrets.LIGHTHOUSE_CHECK_AWS_ACCESS_KEY_ID }}
              awsBucket: ${{ secrets.LIGHTHOUSE_CHECK_AWS_BUCKET }}
              awsRegion: ${{ secrets.LIGHTHOUSE_CHECK_AWS_REGION }}
              awsSecretAccessKey: ${{ secrets.LIGHTHOUSE_CHECK_AWS_SECRET_ACCESS_KEY }}
              branch: ${{ github.ref }}
              outputDirectory: /tmp/artifacts
              urls: 'https://www.foo.software,https://www.foo.software/contact'
              sha: ${{ github.sha }}
              slackWebhookUrl: ${{ secrets.LIGHTHOUSE_CHECK_WEBHOOK_URL }}
            
          - name: Upload artifacts
            uses: actions/upload-artifact@master
            with:
              name: Lighthouse reports
              path: /tmp/artifacts
    ```


{% endraw %}
