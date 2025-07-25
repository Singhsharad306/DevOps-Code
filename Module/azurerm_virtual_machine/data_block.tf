data "azurerm_public_ip" "pip"{
  name                = "krishna_airtel"
  resource_group_name = "rg-banking-app"
}



data "azurerm_network_interface" "nic" {
  name                = "tower1"
  resource_group_name = "rg-banking-app"
}


data "azurerm_subnet" "frount_subnet" {
   name                 = "frount_subnet"
   virtual_network_name = "krishna-dev-vnet"
   resource_group_name  = "rg-banking-app"
 }