include "root" {
  path = find_in_parent_folders("root.hcl")
}

inputs = {
  vpc_name = values.vpc_name
  vpc_cidr = values.vpc_cidr
}