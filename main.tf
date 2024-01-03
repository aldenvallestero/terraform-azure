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

resource "azurerm_resource_group" "dev-playground-rg" {
  name     = "dev-playground-rg"
  location = "eastasia"
  tags = {
    env = "dev"
  }
  
  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_static_site" "dev-playground-client" {
  name     = "dev-playground-client"
  location = azurerm_resource_group.dev-playground-rg.location
  resource_group_name = azurerm_resource_group.dev-playground-rg.name
  tags = {
    env = "dev"
  }
}

resource "azurerm_virtual_network" "dev-playground-net" {
  name = "dev-playground-net"
  address_space = [ "10.0.0.0/16" ]
  location = azurerm_resource_group.dev-playground-rg.location
  resource_group_name = azurerm_resource_group.dev-playground-rg.name
  tags = {
    env = "dev"
  }
}

resource "azurerm_subnet" "dev-playground-subnet" {
  name = "dev-playground-subnet"
  resource_group_name = azurerm_resource_group.dev-playground-rg.name
  virtual_network_name = azurerm_virtual_network.dev-playground-net.name
  address_prefixes = [ "10.0.2.0/24" ]
}
