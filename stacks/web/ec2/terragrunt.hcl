include "root" {
  path = find_in_parent_folders("root.hcl")
}


dependency "vpc" {
  config_path = "../../../../networking/.terragrunt-stack/.terragrunt-stack/vpc/"

  mock_outputs = {
    vpc_id = "mock-vpc-output"
    vpc_output = "mock-vpc-output"
  }

  skip_outputs = true
}

inputs = {
  vpc_id = dependency.vpc.outputs.vpc_id
  instance_type = values.instance_type
}
