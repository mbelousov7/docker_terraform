#export ENV=prod2
#export ENV=stage
include .env
#export TF_WORKSPACE
#export TF_VAR_file_account
#export TF_VAR_project
#export TF_VAR_grafana_password
#export TF_VAR_location

#VARS=variables/terraform-$(ENV).tfvars

export GOOGLE_CREDENTIALS

build:
	docker build -t drjetf/terraform:2.0 .


apply:
	docker run  \
	-e GOOGLE_CREDENTIALS=${GOOGLE_CREDENTIALS} \
	--rm drjetf/terraform:2.0 \
	&& terraform apply -var-file="terraform-${ENV}.tfvars" \
	-auto-approve

destroy:
	docker run  \
  -e GOOGLE_CREDENTIALS=${GOOGLE_CREDENTIALS} \
  --rm drjetf/terraform:2.0 \
  && terraform destroy -var-file="terraform-${ENV}.tfvars" \
  -auto-approve



# -v "$(pwd)"/keys:/terraform/keys \
#	terraform workspace select $(ENV) && terraform apply -var-file="$(VARS)" -auto-approve

#plan:
#	terraform workspace select $(ENV) && terraform plan -var-file="$(VARS)"

#destroy:
#	terraform workspace select $(ENV) && terraform destroy -auto-approve -target=module.helm_loki -target=module.helm_prometheus -target=module.helm_ingress -var-file="$(VARS)"
#	terraform destroy -auto-approve -var-file="$(VARS)"
