output "vpc_id" {
  value = data.aws_vpc.main.id
}

output "subnets_private" {
  value = data.aws_subnet_ids.main.ids
}

output "security_group" {
  value = aws_security_group.main.*.id
}