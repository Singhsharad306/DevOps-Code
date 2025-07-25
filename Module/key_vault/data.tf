data "azurerm_key_vault" "keyvault_data" {
    depends_on = [ azurerm_key_vault.keytala ]
  name                = "banklokar"
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "key_secret_admin" {
  name         = "bankadmin"
  key_vault_id = data.azurerm_key_vault.keyvault_data.id
}

data "azurerm_key_vault_secret" "key_secret_password" {
  name         = "bankadminpassword"
  key_vault_id = data.azurerm_key_vault.keyvault_data.id
}