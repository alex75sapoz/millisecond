variable "environment" {
  type = object({
    id   = string
    name = string
  })
}

variable "region" {
  type = object({
    id   = string
    name = string
  })
}

variable "vpc" {
  type = object({
    cidr                 = string
    availability_zone_id = string
    subnet = object({
      public = object({
        cidr = string
      })
      private = object({
        cidr = string
      })
    })
  })
}