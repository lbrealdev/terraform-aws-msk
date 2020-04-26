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
  count = var.create ? 1 : 0

  vpc_id      = data.aws_vpc.main.id
  name        = lookup(var.security_group[count.index], "name", null)
  description = lookup(var.security_group[count.index], "description", null)
}

resource "aws_security_group_rule" "ingress" {
  count = var.create ? 1 : 0

  type              = lookup(var.ingress_rules[count.index], "type", null)
  from_port         = lookup(var.ingress_rules[count.index], "port", null)
  to_port           = lookup(var.ingress_rules[count.index], "port", null)
  protocol          = lookup(var.ingress_rules[count.index], "protocol", null)
  description       = lookup(var.ingress_rules[count.index], "description", null)
  cidr_blocks       = lookup(var.ingress_rules[count.index], "cidr_blocks", null)
  security_group_id = aws_security_group.main[count.index].id
}

resource "aws_security_group_rule" "egress" {
  count = var.create ? 1 : 0

  type              = lookup(var.egress_rules[count.index], "type", null)
  from_port         = lookup(var.egress_rules[count.index], "port", null)
  to_port           = lookup(var.egress_rules[count.index], "port", null)
  protocol          = lookup(var.egress_rules[count.index], "protocol", null)
  description       = lookup(var.egress_rules[count.index], "description", null)
  cidr_blocks       = lookup(var.egress_rules[count.index], "cidr_blocks", null)
  security_group_id = aws_security_group.main[count.index].id
}


resource "aws_security_group" "test" {
  count = var.create && data.aws_vpc.main != "" ? 1 : 0

  vpc_id      = data.aws_vpc.main.id
  name        = lookup(var.security_group[count.index], "name", null)
  name_prefix = "sg.msk-"
  description = "Managed by Terraform"

  ingress {
    from_port   = lookup(var.ingress_rules[count.index], "port", null)
    protocol    = lookup(var.ingress_rules[count.index], "protocol", null)
    to_port     = lookup(var.ingress_rules[count.index], "port", null)
    cidr_blocks = slice(lookup(var.ingress_rules[count.index], "cidr_blocks", null), 0, 1)
    description = "Access from dev.euc1.private-az1.subnet"
  }

  ingress {
    from_port   = lookup(var.ingress_rules[count.index], "port", null)
    protocol    = lookup(var.ingress_rules[count.index], "protocol", null)
    to_port     = lookup(var.ingress_rules[count.index], "port", null)
    cidr_blocks = slice(lookup(var.ingress_rules[count.index], "cidr_blocks", null), 1, 2)
    description = "Access from dev.euc1.private-az2.subnet"
  }

  ingress {
    from_port   = lookup(var.ingress_rules[count.index], "port", null)
    protocol    = lookup(var.ingress_rules[count.index], "protocol", null)
    to_port     = lookup(var.ingress_rules[count.index], "port", null)
    cidr_blocks = slice(lookup(var.ingress_rules[count.index], "cidr_blocks", null), 2, 3)
    description = "Access from dev.euc1.private-az3.subnet"
  }

  egress {
    from_port   = lookup(var.egress_rules[count.index], "port", null)
    protocol    = lookup(var.egress_rules[count.index], "protocol", null)
    to_port     = lookup(var.egress_rules[count.index], "port", null)
    cidr_blocks = slice(lookup(var.egress_rules[count.index], "cidr_blocks", null), 0, 1)
    description = "Access internet"
  }
}