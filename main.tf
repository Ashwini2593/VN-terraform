provider "azurerm" {
  features {}
  subscription_id = "3a72be92-287b-4f1e-840a-5e3e71100139"
  resource_provider_registrations = "none"
}

# Resource Group
#resource "azurerm_resource_group" "rg" {
# name     = "rg-aztraining-cat-uk"
 # location = "UK South"
#}

# Data source to fetch existing resource group
data "azurerm_resource_group" "existing_rg" {
  name = var.resource_group_name
}

# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "ashwinimy-vnet"
  location            = data.azurerm_resource_group.existing_rg.location
  resource_group_name = data.azurerm_resource_group.existing_rg.name
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = "dev"
  }
}

# Subnet 1
resource "azurerm_subnet" "subnet_1" {
  name                 = "subnet-1"
  resource_group_name  = data.azurerm_resource_group.existing_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Subnet 2
resource "azurerm_subnet" "subnet_2" {
  name                 = "subnet-2"
  resource_group_name  = data.azurerm_resource_group.existing_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

