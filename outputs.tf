output "this_vpc_id" {
  value = module.network.vpc_id
}

output "this_subnets_private" {
  value = module.network.subnets_private
}