# Lighthouse check

{% raw %}

[lighthouse-check](https://github.com/marketplace/actions/lighthouse-check) in the Marketplace.


## Samples

### Basic

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
