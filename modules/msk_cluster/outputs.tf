output "msk_cluster" {
  value = concat(
    aws_msk_cluster.main.*.cluster_name,
    aws_msk_cluster.main.*.id,
    aws_msk_cluster.main.*.arn,
    aws_msk_cluster.main.*.broker_node_group_info
  )
}