locals {
  constants = {
    environment = var.environment
    region      = var.region
    repository = {
      id   = "ms"
      name = "millisecond"
    }
  }
}

module "network" {
  source    = "./network"
  constants = local.constants
  vpc       = var.vpc
}

module "functions" {
  source    = "./functions"
  constants = local.constants
}