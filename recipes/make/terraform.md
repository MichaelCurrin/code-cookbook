---
description: Makefiles for Terraform
---
# Terraform

## Resources

- https://www.terraform.io/
- https://registry.terraform.io/


## Sample

Here is an example of a `Makefile` which is used to deploy AWS infrastructure. In the case I worked on, this was to deploy a Lambda which two possible instances which have `_dev` or `_prod` in the resource name.

- `Makefile`
    ```Makefile
    check-env :
      @if [ -z $(ENV) ]; then \
        echo "ENV must be set; export ENV=<env>"; exit 10; \
      fi

    init : check-env
      terraform init -upgrade
      terraform workspace select $(ENV) || \
        terraform workspace new $(ENV)

    plan: init
      mkdir -p plans
      terraform plan -out=plans/$(ENV).tfplan

    apply : plan
      terraform apply plans/$(ENV).tfplan
    ```

This takes care of validating the required env variable, running TF commas as `init` and then a `plan` or `apply` as required.


## Usage

```sh
$ export ENV=dev
$ make plan
$ make apply
```
