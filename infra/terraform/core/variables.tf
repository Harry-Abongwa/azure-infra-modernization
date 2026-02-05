variable "resource_group_name" {
  type    = string
  default = "rg-core-infra"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "tags" {
  type = map(string)
  default = {
    Owner   = "Harry"
    Project = "azure-infra-modernization"
  }
}

variable "admin_username" {
  type    = string
  default = "azureadmin"
}

variable "admin_password" {
  type      = string
  sensitive = true
}
