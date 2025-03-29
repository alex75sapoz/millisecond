variable "constants" {
  type = object({
    region = object({
      id = string
    })
    environment = object({
      id = string
    })
  })
}

variable "vpc" {
  type = object({
    cidr = string
    subnet = object({
      public = object({
        cidr                 = string
        availability_zone_id = string
      })
      private = object({
        cidr                 = string
        availability_zone_id = string
      })
    })
  })
}