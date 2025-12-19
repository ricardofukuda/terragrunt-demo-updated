output "env"{
  value = var.env
}

output "vpc_id"{
  value = var.vpc_id
}

output "ec2_id"{
  value = aws_instance.example.id
}
