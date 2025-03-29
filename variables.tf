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