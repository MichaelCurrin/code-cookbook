# Terraform

## Dockerfile example

I use this at work to setup a certain version of Terraform. Note that `apt` does not provide Terraform.

I copy the entire git repo into the image.

```dockerfile
FROM ubuntu

RUN apt update
RUN apt install -y -q git \
	wget \
	zip \
	make
	
WORKDIR /root

# TF v0.12.20
RUN wget https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip
RUN	unzip terraform_0.12.20_linux_amd64.zip
RUN mv terraform /usr/local/bin
RUN terraform version

COPY . /root
```

## Docker hub example

As an alternative, you can use this Terraform container binary.

- https://hub.docker.com/r/hashicorp/terraform/

Then, in place of this:

```sh
$ terraform plan main.tf
```

You can use:

```sh
$ docker run -i -t hashicorp/terraform:full plan main.tf
```
