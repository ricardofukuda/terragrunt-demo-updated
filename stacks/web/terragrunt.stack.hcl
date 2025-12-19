unit "ec2" {
  source = "ec2"
  path   = "ec2"
  values = {
    instance_type = values.instance_type
  }
}

