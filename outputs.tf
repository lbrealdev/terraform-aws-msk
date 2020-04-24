output "this_vpc_id" {
  value = module.network.vpc_id
}

output "this_subnets_private" {
  value = module.network.subnets_private
}

output "this_mks_cluster" {
  value = module.msk_cluster.cluster
}