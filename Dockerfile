FROM hashicorp/terraform:light

WORKDIR /terraform


COPY modules /terraform/modules
COPY main.tf /terraform
COPY variables.tf /terraform
COPY *.tfvars /terraform


RUN ["terraform", "init", "-backend=false"]
