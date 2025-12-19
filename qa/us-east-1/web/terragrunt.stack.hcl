stack "web" {
  source = "../../../stacks/web"
  path   = "."
  values = {
    instance_type = "t3.micro"
  }
}