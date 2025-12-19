unit "vpc" {
  source = "vpc"
  path   = "vpc"

  values = {
    vpc_name = values.vpc_name
    vpc_cidr = values.vpc_cidr
  }
}

unit "sg" {
  source = "sg"
  path   = "sg"
}

