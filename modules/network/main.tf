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

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value["port"]
      to_port     = ingress.value["port"]
      protocol    = ingress.value["protocol"]
      description = data.aws_subnet_ids.main.tags[*]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }

}

/*
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

  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  description       = "Managed by terraform"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.main[count.index].id
}*/
