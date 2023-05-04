#########################################################
# Variables
#########################################################

variable vwan-rg-name {
  description = "Resource group for primary Azure region"
  type        = string
  default     = "VWAN-Demo-rg"
}

variable "vwan-rg-location" {
  description   = "Azure location for primary region"
  type          = string
  default       = "northeurope"
}

variable "vwan-name" {
  description   = "Name of Virtual WAN"
  type          = string
  default       = "VWAN-bootcamp"
}

variable "vwan-vhub1" {
  description   = "Name of Virtual WAN - HUb1"
  type          = string
  default       = "VWH-NEU"
}
variable "vwan-vhub2" {
  description   = "Name of Virtual WAN - HUb2"
  type          = string
  default       = "VWH-SAN"
}
variable "vwan-vhub3" {
  description   = "Name of Virtual WAN - HUb3"
  type          = string
  default       = "VWH-SEA"
}
variable VHUB-VNET-name1 {
  description = "name of virtual network hub in first region"
  type        = string
  default     = "VNET-NEU"
}

variable VHUB-VNET-name2 {
  description = "name of virtual network hub in second region"
  type        = string
  default     = "VNET-SAN"
}

variable VHUB-VNET-name3 {
  description = "name of virtual network hub in third region"
  type        = string
  default     = "VNET-SEA"
}
variable "VHUB-location1" {
  description = "Azure location for VHUB region1"
  type        = string
  default       = "northeurope"
}


variable "VHUB-location2" {
  description = "Azure location for VHUB region2"
  type        = string
  default       = "southafricanorth"
}


variable "VHUB-location3" {
  description = "Azure location for VHUB region3"
  type        = string
  default       = "southeastasia"
}

variable "vpngw-shared-key" {
    description = "Shared key for VNet 2  VNet connections"
    type = string
    default = "P@$$w0rd@2023"
}

variable "vm-user" {
    description = "Admin username for all VMs in the lab"
    type = string
    default = "azureuser"
}

variable "vm-password" {
    description = "Password for all VMs in the lab"
    type = string
}

variable "vm-size" {
    description = "Azure VM size for all VMs in the lab"
    type = string
    default = "Standard_B2s"
}



#########################################################
# Locals
#########################################################

locals {
    vwan-vhub1-prefix="10.0.1.0/24"
    vwan-vhub2-prefix="10.0.2.0/24"
    vwan-vhub3-prefix="10.0.3.0/24"
    
    vnet1-prefix = ["10.1.0.0/16"]
    vnet1-gatewaysubnet = [ "10.1.0.0/27" ]
    vnet1-azurebastionsubnet = [ "10.1.0.32/27" ]
    vnet1-azurefirewallsubnet = [ "10.1.0.64/26" ]
    vnet1-vmsubnet = [ "10.1.1.0/24" ]
    vnet1-dbsubnet = [ "10.1.2.0/24" ]

    vnet2-prefix = ["10.2.0.0/16"]
    vnet2-gatewaysubnet = [ "10.2.0.0/27" ]
    vnet2-azurebastionsubnet = [ "10.2.0.32/27" ]
    vnet2-azurefirewallsubnet = [ "10.2.0.64/26" ]
    vnet2-vmsubnet = [ "10.2.1.0/24" ]
    vnet2-dbsubnet = [ "10.2.2.0/24" ]

    vnet3-prefix = ["10.3.0.0/16"]
    vnet3-gatewaysubnet = [ "10.3.0.0/27" ]
    vnet3-azurebastionsubnet = [ "10.3.0.32/27" ]
    vnet3-azurefirewallsubnet = [ "10.3.0.64/26" ]
    vnet3-vmsubnet = [ "10.3.1.0/24" ]
    vnet3-dbsubnet = [ "10.3.2.0/24" ]
   
}