resource "azurerm_public_ip" "airtel1" {
  name                = var.name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  sku               = "Basic"

}