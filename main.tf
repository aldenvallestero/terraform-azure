terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = "dev-playground-001"
  location = "eastasia"
}

resource "azurerm_static_site" "dev-playground-client-001" {
  name     = "dev-playground-client-001"
  location = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_static_site" "dev-playground-client-002" {
  name     = "dev-playground-client-002"
  location = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_static_site" "dev-playground-client-003" {
  name     = "dev-playground-client-003"
  location = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}
