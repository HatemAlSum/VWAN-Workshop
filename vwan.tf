resource "azurerm_virtual_wan" "vwan-main" {
  name                = var.vwan-name
  resource_group_name = azurerm_resource_group.vwan-rg.name
  location            = azurerm_resource_group.vwan-rg.location
}

resource "azurerm_virtual_hub" "vwan-vhub1" {
  name                = var.vwan-vhub1
  resource_group_name = azurerm_resource_group.vwan-rg.name
  location            = var.VHUB-location1
  virtual_wan_id      = azurerm_virtual_wan.vwan-main.id
  address_prefix      = local.vwan-vhub1-prefix
}

resource "azurerm_virtual_hub" "vwan-vhub2" {
  name                = var.vwan-vhub2
  resource_group_name = azurerm_resource_group.vwan-rg.name
  location            = var.VHUB-location2
  virtual_wan_id      = azurerm_virtual_wan.vwan-main.id
  address_prefix      = local.vwan-vhub2-prefix
}

resource "azurerm_virtual_hub" "vwan-vhub3" {
  name                = var.vwan-vhub3
  resource_group_name = azurerm_resource_group.vwan-rg.name
  location            = var.VHUB-location3
  virtual_wan_id      = azurerm_virtual_wan.vwan-main.id
  address_prefix      = local.vwan-vhub3-prefix
}



resource "azurerm_virtual_hub_connection" "vwan-vhub1-vnet1-conn" {
  name                      = "vwan-vhub1-vnet1"
  virtual_hub_id            = azurerm_virtual_hub.vwan-vhub1.id
  remote_virtual_network_id = azurerm_virtual_network.vwan-vnet-1.id
}

resource "azurerm_virtual_hub_connection" "vwan-vhub2-vnet2-conn" {
  name                      = "vwan-vhub2-vnet2"
  virtual_hub_id            = azurerm_virtual_hub.vwan-vhub2.id
  remote_virtual_network_id = azurerm_virtual_network.vwan-vnet-2.id
}

resource "azurerm_virtual_hub_connection" "vwan-vhub3-vnet3-conn" {
  name                      = "vwan-vhub3-vnet3"
  virtual_hub_id            = azurerm_virtual_hub.vwan-vhub3.id
  remote_virtual_network_id = azurerm_virtual_network.vwan-vnet-3.id
}