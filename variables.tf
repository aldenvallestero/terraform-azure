variable "location" {
  default = "eastasia"
}

variable "username" {
  description = "VM Admin Username"
  type = string
  sensitive = true
}

variable "password" {
  description = "VM Admin Password"
  type = string
  sensitive = true
}
