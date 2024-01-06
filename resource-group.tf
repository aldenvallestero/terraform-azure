resource "azurerm_resource_group" "dev-playground-rg" {
  name     = "dev-playground-rg"
  location = var.location
  tags = {
    env = "dev"
  }

  lifecycle {
    prevent_destroy = true
  }
}