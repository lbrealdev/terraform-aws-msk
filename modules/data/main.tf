# ----------------------------------------------------------------------------------------------------------------------
# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER
# This module has been updated with 0.12 syntax, which means it is no longer compatible with any versions below 0.12.
# ----------------------------------------------------------------------------------------------------------------------
terraform {
  required_version = "~> 0.12"
}

# ---------------------------------------------------------------------------------------------------------------------
# GET ALL DATA FROM AMAZON MSK CLUSTER
# ---------------------------------------------------------------------------------------------------------------------

data "aws_msk_cluster" "main" {
  count = var.data ? 1 : 0

  cluster_name = var.cluster_name
}

data "aws_msk_configuration" "main" {
  count = var.data ? 1 : 0

  name = var.msk_configuration_name
}