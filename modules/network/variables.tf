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