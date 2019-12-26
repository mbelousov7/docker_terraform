# docker_terraform

export ENV=stage
terraform workspace new ${ENV}       
terraform workspace select ${ENV} && terraform init
docker run  --env-file .env --rm drjetf/terraform:2.0
docker run  -e GOOGLE_CREDENTIALS=${GOOGLE_CREDENTIALS} --rm drjetf/terraform:2.0
