data "aws_subnet" "selected" {
  availability_zone = "us-east-1d"
  vpc_id = var.vpc_id

  filter {
    name   = "tag:Tier"
    values = ["private"]
  }
}