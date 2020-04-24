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
  name              = ""
  kafka_versions    = []
  server_properties = <<PROPERTIES


PROPERTIES
}