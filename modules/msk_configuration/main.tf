# ----------------------------------------------------------------------------------------------------------------------
# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER
# This module has been updated with 0.12 syntax, which means it is no longer compatible with any versions below 0.12.
# ----------------------------------------------------------------------------------------------------------------------
terraform {
  required_version = "~> 0.12"
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE AMAZON MSK CONFIGURATION
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_msk_configuration" "main" {
  name              = var.name
  description       = var.description
  kafka_versions    = var.kafka_versions
  server_properties = var.server_properties
}