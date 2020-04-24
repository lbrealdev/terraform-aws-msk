# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "name" {
  description = "Name of the configuration."
  type        = string
}

variable "kafka_versions" {
  description = "List of Apache Kafka versions which can use this configuration."
  type        = list(string)
}

variable "description" {
  description = "Description of the configuration."
  type        = string
  default     = "Amazon MSK configuration"
}

variable "server_properties" {
  description = "Contents of the server.properties file."
  type        = any
  default     = <<PROPERTIES
auto.create.topics.enable=false
default.replication.factor=2
min.insync.replicas=2
num.io.threads=8
num.network.threads=5
num.partitions=1
num.replica.fetchers=2
socket.request.max.bytes=104857600
unclean.leader.election.enable=true
PROPERTIES
}