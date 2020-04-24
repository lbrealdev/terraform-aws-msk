# ----------------------------------------------------------------------------------------------------------------------
# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER
# This module has been updated with 0.12 syntax, which means it is no longer compatible with any versions below 0.12.
# ----------------------------------------------------------------------------------------------------------------------
terraform {
  required_version = "~> 0.12"
}

# ---------------------------------------------------------------------------------------------------------------------
# GET DATA VPC / CREATE NETWORK RESOURCES
# ---------------------------------------------------------------------------------------------------------------------

data "aws_vpc" "main" {
  state = var.vpc_id
}

data "aws_subnet_ids" "main" {
  vpc_id = data.aws_vpc.main.id

  tags = {
    Name = "*.private-*"
  }
}

resource "aws_security_group" "main" {

  vpc_id      = data.aws_vpc.main.id
  name        = ""
  description = ""
}

resource "aws_security_group_rule" "ingress" {
  from_port = 0
  protocol = ""
  security_group_id = ""
  to_port = 0
  type = ""
}

resource "aws_security_group_rule" "egress" {
  from_port = 0
  protocol = ""
  security_group_id = ""
  to_port = 0
  type = ""
}