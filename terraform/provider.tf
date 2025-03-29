provider "aws" {
  region = var.region.id

  default_tags {
    tags = {
      Environment = local.constants.environment.name
      Repository  = local.constants.repository.name
    }
  }
}