# Import

How to import a resource (such as on AWS or Datadog) into a workspace.

Here we import a [Datadog synthetic](https://www.datadoghq.com/). See [DD provider](https://registry.terraform.io/providers/DataDog/datadog/latest/docs) section the Terraform docs.

- `main.tf`
    ```terraform
    resource "datadog_synthetics_test" "this" {}
- `versions.tf`
    ```terraform
    terraform {
      required_version = ">= 0.13"

      required_providers {
        datadog = {
          source  = "DataDog/datadog"
          version = "2.13.0"
        }
      }
    }
    ```

Now we import a Datadog synthetic by its ID.

```sh
$ terraform init
$ terraform workspace select foo || terraform workspace new foo
$ terraform import datadog_synthetics_test.this abc-def-123
```

Note that if you try `terraform plan`, it maybe fail because of lack of required parameters. So put some in. Even if your parameters are wrong, at least you can import the remote resource into state. Then run a plan to see what is on the remote resource and use that diff to build your TF code.

- `main.tf`
    ```terraform
    resource "datadog_synthetics_test" "this" {
      type      = var.check_type
      subtype   = var.sub_type
      name      = var.name
      # ...
    }
    ```
    
Then run plan again.
