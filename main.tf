# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }
  required_version = ">= 1.1.0"
  backend "azurerm" {
    resource_group_name  = "jonnychipz-state"
    storage_account_name = "jonnychipztfstate"
    container_name       = "tstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}

  subscription_id   = "7ed30da0-d878-475f-85b0-f1f907a3a03b"
  tenant_id         = "7ed30da0-d878-475f-85b0-f1f907a3a03b"
  client_id         = "a9a20e58-d742-44a5-9846-4f2fcdb8213b"
  client_secret     = "5xUWcFhXVTnz.afL4ib6EyyJpX1v.Im7rC"
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
