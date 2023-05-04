
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=2.90"
    }
  }
}

provider "azurerm" {
  features {}
}

#########################################################
# Resource Groups 
#########################################################
resource "azurerm_resource_group" "vwan-rg" {
  name     = var.vwan-rg-name
  location = var.vwan-rg-location
}
