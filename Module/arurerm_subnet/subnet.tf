resource "azurerm_subnet" "frount" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes

}
# resource "azurerm_subnet" "backend" {
#   name                 = var.backend_subnet
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = var.virtual_network_name
#   address_prefixes     = ["10.0.3.0/24"]
# }

