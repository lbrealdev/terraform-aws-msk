output "this_vpc_id" {
  value = data.aws_vpc.main.id
}

output "this_subnet_privates" {
  value = data.aws_subnet_ids.main.ids
}