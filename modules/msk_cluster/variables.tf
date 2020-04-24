# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "create_msk" {
  description = "Controls if the MSK Cluster should be created."
  type        = string
  default     = true
}

variable "cluster_name" {
  description = "Name of the MSK cluster."
  type        = string
  default     = null
}

variable "kafka_version" {
  description = "Specify the desired Kafka software version."
  type        = string
  default     = null
}

variable "number_of_broker_nodes" {
  description = "The desired total number of broker nodes in the kafka cluster. It must be a multiple of the number of specified client subnets."
  type        = number
  default     = null
}

variable "broker_node_group_info" {
  description = "Configuration block for the broker nodes of the Kafka cluster."
  type        = list(map(string))
  default = [
    {
      ebs_volume_size = 10
      instance_type   = "kafka.t3.small"
    }
  ]
}