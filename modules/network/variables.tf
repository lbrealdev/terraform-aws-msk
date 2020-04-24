# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "create" {
  description = "Controls if the Security Group should be created."
  type        = bool
  default     = true
}

variable "vpc_id" {
  description = "The current state of the desired VPC. Can be either `pending` or `available`."
  type        = string
  default     = "available"
}

variable "security_group" {
  description = "Security group configuration."
  type        = list(map(string))
  default = [
    {
      name        = "sg-msk-cluster"
      description = "Security group for MSK Cluster."
    }
  ]
}

variable "ingress_rules" {
  type = any
  default = [
    {
      type        = "ingress"
      port        = 0
      protocol    = "-1"
      description = ["az1", "az2", "az3"]
      cidr_blocks = ["10.156.32.0/26", "10.156.32.64/26", "10.156.32.128/26"]
    }
  ]
}