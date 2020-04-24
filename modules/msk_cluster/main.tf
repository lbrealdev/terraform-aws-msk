# ----------------------------------------------------------------------------------------------------------------------
# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER
# This module has been updated with 0.12 syntax, which means it is no longer compatible with any versions below 0.12.
# ----------------------------------------------------------------------------------------------------------------------
terraform {
  required_version = "~> 0.12"
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE AMAZON MSK CLUSTER
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_msk_cluster" "main" {
  count = var.create_msk ? 1 : 0

  cluster_name           = var.cluster_name
  kafka_version          = var.kafka_version
  number_of_broker_nodes = var.number_of_broker_nodes

  dynamic "broker_node_group_info" {
    iterator = broker_node
    for_each = var.broker_node_group_info
    content {
      client_subnets  = ["subnet-0c671f5fecd358c58", "subnet-0a3eae155513483bc"]
      ebs_volume_size = broker_node.value["ebs_volume_size"]
      instance_type   = broker_node.value["instance_type"]
      security_groups = ["sg-0c148861bfc08dc13"]
    }
  }

  tags = merge(
    {
      Name = format("%s", var.cluster_name)
    },
    {
      Project     = "caucion"
      Environment = "dev"
    }
  )
}