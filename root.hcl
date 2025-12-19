# Configure the remote backend
remote_state {
  backend = "s3"

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }

  config = {
    bucket = "fukuda-dataops-terragrunt-demo"

    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform_lock"
  }
}

# Configure the AWS provider
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "us-east-1"
}
EOF
}

locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl", "${get_terragrunt_dir()}/env.hcl"))
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl", "${get_terragrunt_dir()}/region.hcl"))
}

inputs = {
  aws_region  = local.region_vars.locals.aws_region
  env  = local.env_vars.locals.env
}