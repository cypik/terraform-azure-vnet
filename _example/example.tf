provider "azurerm" {
  features {}
}

##----------------------------------------------------------------------------- 
## Resource group in which all resources will be deployed.
##-----------------------------------------------------------------------------
module "resource_group" {
  source      = "git::git@github.com:opz0/terraform-azure-resource-group.git?ref=master"
  name        = "app"
  environment = "test"
  location    = "North Europe"
}

##----------------------------------------------------------------------------- 
## Virtual Network module call.
##-----------------------------------------------------------------------------
module "vnet" {
  source              = "./../"
  name                = "app"
  environment         = "test"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  address_space       = "10.0.0.0/16"
}
