stack "networking" {
  source = "../../../stacks/networking"
  path   = "."
  values = {
    vpc_name = "qa"
    vpc_cidr = "12.0.0.0/16"
  }
}