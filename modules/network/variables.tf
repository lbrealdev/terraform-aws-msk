# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "vpc_id" {
  description = "The current state of the desired VPC. Can be either `pending` or `available`."
  type = string
  default = "available"
}