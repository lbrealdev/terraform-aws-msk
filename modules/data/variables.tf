# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "data" {
  description = "Bollean for get data msk or not."
  type        = bool
}

variable "cluster_name" {
  description = "Name of the cluster."
  type        = string
  default     = null
}

variable "msk_configuration_name" {
  description = "Name of the configuration."
  type        = string
  default     = null
}