# ----------------------------------------------------------------------------------------------------------------------
# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER
# This module has been updated with 0.12 syntax, which means it is no longer compatible with any versions below 0.12.
# ----------------------------------------------------------------------------------------------------------------------
terraform {
  required_version = "~> 0.12"
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE CLOUDWATCH LOG GROUP
# ---------------------------------------------------------------------------------------------------------------------
locals {
  tags = {
    Description = "Log group for Amazon MSK"
    Environment = "dev"
  }
}

resource "aws_cloudwatch_log_group" "main" {
  name = var.name

  tags = merge(
    local.tags,
    {
      Name = "Log-msk-cluster"
    },
  )
}
