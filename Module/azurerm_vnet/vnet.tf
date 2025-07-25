resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  # dns_servers         = var.dns_servers

  #   subnet {
  #   name             = var.frount_subnet
  #   address_prefixes = var.address_prefixes
  # }

  # subnet {
  #   name             = var.backend_subnet
  #   address_prefixes = var.address_prefixes
  #   security_group   = azurerm_network_security_group.example.id
  # }
}