resource "azurerm_static_site" "dev-playground-client" {
  name                = "dev-playground-client"
  location            = azurerm_resource_group.dev-playground-rg.location
  resource_group_name = azurerm_resource_group.dev-playground-rg.name
  tags = {
    env = "dev"
  }
}