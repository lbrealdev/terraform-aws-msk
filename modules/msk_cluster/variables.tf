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
      az_distribution = "DEFAULT"
    }
  ]
}

variable "client_subnets" {
  description = "A list of subnets to connect to in client VPC."
  type        = list(string)
}

variable "security_groups" {
  description = "A list of the security groups to associate with the elastic network interfaces to control who can communicate with the cluster."
  type        = list(string)
}

variable "configuration_arn" {
  description = "Amazon Resource Name (ARN) of the MSK Configuration to use in the cluster."
  type        = string
}

variable "log_group" {
  description = "Name of the Cloudwatch Log Group to deliver logs to."
  type        = string
}

variable "encryption_in_transit" {
  description = "Configuration block to specify encryption in transit."
  type        = list(map(string))
  default = [
    {
      client_broker = "TLS"
      in_cluster    = true
    }
  ]
}

/*
variable "encryption_at_rest_kms_key_arn" {
  description = "You may specify a KMS key short ID or ARN (it will always output an ARN) to use for encrypting your data at rest."
  type        = string
}*/
