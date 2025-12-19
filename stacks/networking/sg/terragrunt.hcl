dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    vpc_id = "temporary-dummy-id"
  }

  mock_outputs_allowed_terraform_commands = ["validate"]
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

inputs = {
  vpc_id = dependency.vpc.outputs.vpc_id
}