# ----------------------------------------------------------------------------------------------------------------------
# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER
# This module has been updated with 0.12 syntax, which means it is no longer compatible with any versions below 0.12.
# ----------------------------------------------------------------------------------------------------------------------
provider "aws" {
  region = "eu-central-1"
}

terraform {
  required_version = "~> 0.12"
}

# ---------------------------------------------------------------------------------------------------------------------
# DATA/DEPLOY AMAZON MSK CLUSTER
# ---------------------------------------------------------------------------------------------------------------------

module "data_msk" {
  source = "./modules/data"

  data                   = false
  cluster_name           = "MskClusterDevCaucion"
  msk_configuration_name = "MskConfigurationClusterDevCaucion"
}

module "network" {
  source = "./modules/network"
}

module "msk_cluster" {
  source = "./modules/msk_cluster"

  cluster_name           = "msk-terraform"
  kafka_version          = "2.2.1"
  number_of_broker_nodes = 2
  client_subnets         = module.network.subnets_private
  security_groups        = module.network.security_group
}