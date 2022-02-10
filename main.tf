# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }
  backend "azurerm" {
    resource_group_name  = "myTFResourceGroup"
    storage_account_name = "storagetest222"
    container_name       = "newtest"
    key                  = "terra.tfstate"
  }

}




resource "azurerm_resource_group" "rg" {
  #name     = "myTFResourceGroup"
  name     = var.resource_group_name
  location = "centralindia"
  tags = {
    Environment = "Terraform Getting Started"
    Team        = "DevOps"
  }
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "myTFVnet"
  address_space       = ["10.0.0.0/16"]
  location            = "centralindia"
  resource_group_name = azurerm_resource_group.rg.name
}
