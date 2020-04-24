output "cluster" {
  value = concat(
    aws_msk_cluster.main.*.cluster_name,
    aws_msk_cluster.main.*.kafka_version,
    aws_msk_cluster.main.*.arn,
    aws_msk_cluster.main.*.number_of_broker_nodes,
    aws_msk_cluster.main.*.broker_node_group_info,
    aws_msk_cluster.main.*.zookeeper_connect_string,
    aws_msk_cluster.main.*.encryption_info
  )
}