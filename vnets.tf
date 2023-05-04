##############################
# First VNET
##############################

resource "azurerm_virtual_network" "vwan-vnet-1" {
  name                = var.VHUB-VNET-name1
  location            = var.VHUB-location1
  resource_group_name = azurerm_resource_group.vwan-rg.name
  address_space       = local.vnet1-prefix
}

resource "azurerm_subnet" "vwan-vnet-1-gatewaysubnet" {
    name                    = "GatewaySubnet"
    resource_group_name     = azurerm_resource_group.vwan-rg.name
    virtual_network_name    = azurerm_virtual_network.vwan-vnet-1.name
    address_prefixes        = local.vnet1-gatewaysubnet
}

resource "azurerm_subnet" "vwan-vnet-1-bastionsubnet" {
    name                    = "AzureBastionSubnet"
    resource_group_name     = azurerm_resource_group.vwan-rg.name
    virtual_network_name    = azurerm_virtual_network.vwan-vnet-1.name
    address_prefixes        = local.vnet1-azurebastionsubnet
}
resource "azurerm_subnet" "vwan-vnet-1-firewallsubnet" {
    name                    = "AzureFirewallSubnet"
    resource_group_name     = azurerm_resource_group.vwan-rg.name
    virtual_network_name    = azurerm_virtual_network.vwan-vnet-1.name
    address_prefixes        = local.vnet1-azurefirewallsubnet
}
resource "azurerm_subnet" "vwan-vnet-1-vmsubnet" {
    name                    = "VMSubnet"
    resource_group_name     = azurerm_resource_group.vwan-rg.name
    virtual_network_name    = azurerm_virtual_network.vwan-vnet-1.name
    address_prefixes        = local.vnet1-vmsubnet
}
resource "azurerm_subnet" "vwan-vnet-1-dbsubnet" {
    name                    = "DBSubnet"
    resource_group_name     = azurerm_resource_group.vwan-rg.name
    virtual_network_name    = azurerm_virtual_network.vwan-vnet-1.name
    address_prefixes        = local.vnet1-dbsubnet
}


##############################
# Second VNET
##############################

resource "azurerm_virtual_network" "vwan-vnet-2" {
  name                = var.VHUB-VNET-name2
  location            = var.VHUB-location2
  resource_group_name = azurerm_resource_group.vwan-rg.name
  address_space       = local.vnet2-prefix
}

resource "azurerm_subnet" "vwan-vnet-2-gatewaysubnet" {
    name                    = "GatewaySubnet"
    resource_group_name     = azurerm_resource_group.vwan-rg.name
    virtual_network_name    = azurerm_virtual_network.vwan-vnet-2.name
    address_prefixes        = local.vnet2-gatewaysubnet
}

resource "azurerm_subnet" "vwan-vnet-2-bastionsubnet" {
    name                    = "AzureBastionSubnet"
    resource_group_name     = azurerm_resource_group.vwan-rg.name
    virtual_network_name    = azurerm_virtual_network.vwan-vnet-2.name
    address_prefixes        = local.vnet2-azurebastionsubnet
}
resource "azurerm_subnet" "vwan-vnet-2-firewallsubnet" {
    name                    = "AzureFirewallSubnet"
    resource_group_name     = azurerm_resource_group.vwan-rg.name
    virtual_network_name    = azurerm_virtual_network.vwan-vnet-2.name
    address_prefixes        = local.vnet2-azurefirewallsubnet
}
resource "azurerm_subnet" "vwan-vnet-2-vmsubnet" {
    name                    = "VMSubnet"
    resource_group_name     = azurerm_resource_group.vwan-rg.name
    virtual_network_name    = azurerm_virtual_network.vwan-vnet-2.name
    address_prefixes        = local.vnet2-vmsubnet
}
resource "azurerm_subnet" "vwan-vnet-2-dbsubnet" {
    name                    = "DBSubnet"
    resource_group_name     = azurerm_resource_group.vwan-rg.name
    virtual_network_name    = azurerm_virtual_network.vwan-vnet-2.name
    address_prefixes        = local.vnet2-dbsubnet
}

##############################
# Third VNET
##############################

resource "azurerm_virtual_network" "vwan-vnet-3" {
  name                = var.VHUB-VNET-name3
  location            = var.VHUB-location3
  resource_group_name = azurerm_resource_group.vwan-rg.name
  address_space       = local.vnet3-prefix
}

resource "azurerm_subnet" "vwan-vnet-3-gatewaysubnet" {
    name                    = "GatewaySubnet"
    resource_group_name     = azurerm_resource_group.vwan-rg.name
    virtual_network_name    = azurerm_virtual_network.vwan-vnet-3.name
    address_prefixes        = local.vnet3-gatewaysubnet
}

resource "azurerm_subnet" "vwan-vnet-3-bastionsubnet" {
    name                    = "AzureBastionSubnet"
    resource_group_name     = azurerm_resource_group.vwan-rg.name
    virtual_network_name    = azurerm_virtual_network.vwan-vnet-3.name
    address_prefixes        = local.vnet3-azurebastionsubnet
}
resource "azurerm_subnet" "vwan-vnet-3-firewallsubnet" {
    name                    = "AzureFirewallSubnet"
    resource_group_name     = azurerm_resource_group.vwan-rg.name
    virtual_network_name    = azurerm_virtual_network.vwan-vnet-3.name
    address_prefixes        = local.vnet3-azurefirewallsubnet
}
resource "azurerm_subnet" "vwan-vnet-3-vmsubnet" {
    name                    = "VMSubnet"
    resource_group_name     = azurerm_resource_group.vwan-rg.name
    virtual_network_name    = azurerm_virtual_network.vwan-vnet-3.name
    address_prefixes        = local.vnet3-vmsubnet
}
resource "azurerm_subnet" "vwan-vnet-3-dbsubnet" {
    name                    = "DBSubnet"
    resource_group_name     = azurerm_resource_group.vwan-rg.name
    virtual_network_name    = azurerm_virtual_network.vwan-vnet-3.name
    address_prefixes        = local.vnet3-dbsubnet
}




#########################################################
# Azure Bastion for first VNET
######################################################### 

resource "azurerm_public_ip" "vwan-vnet-1-bastion-pip" {
  name                =  format("%s-%s",var.VHUB-VNET-name1, "bastion-pip") 
  location            = azurerm_resource_group.vwan-rg.location
  resource_group_name = azurerm_resource_group.vwan-rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "vwan-vnet-1-bastion-bastion" {
  name                = format("%s-%s",var.VHUB-VNET-name1, "bastion")
  location            = azurerm_resource_group.vwan-rg.location
  resource_group_name = azurerm_resource_group.vwan-rg.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.vwan-vnet-1-bastionsubnet.id
    public_ip_address_id = azurerm_public_ip.vwan-vnet-1-bastion-pip.id
  }

  ip_connect_enabled = true
}
