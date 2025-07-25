data "azurerm_network_security_group" "nice" {
  name                = "tuffon_nsg"
  resource_group_name = "rg-banking-app"
}

data "azurerm_subnet" "frount_subnet" {
  name                 = "frount_subnet"
  virtual_network_name = "krishna-dev-vnet"
  resource_group_name  = "rg-banking-app"
}


data "azurerm_public_ip" "pip" {
  name                = "krishna_airtel"
  resource_group_name = "rg-banking-app"
}

data "azurerm_key_vault_secret" "key_secret_admin" {
  name         = "bankadmin"
  key_vault_id = data.azurerm_key_vault.keyvault_data.id
}

data "azurerm_key_vault_secret" "key_secret_password" {
  name         = "bankadminpassword"
  key_vault_id = data.azurerm_key_vault.keyvault_data.id
}


data "azurerm_key_vault" "keyvault_data" {
  depends_on          = [module.key_vault]
  name                = "banklokar"
  resource_group_name = "rg-banking-app"
}