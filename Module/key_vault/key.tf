resource "azurerm_key_vault" "keytala" {
  name                        = var.key_vault_name
  location                    = var.resource_group_name
  resource_group_name         = var.location
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
      "list",
      "Set",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

data "azurerm_client_config" "current" {}


resource "azurerm_key_vault_secret" "key_secret_admin"{
  name         = "bankadmin"
  value        = "alli_baba_ki_guffa"
  key_vault_id = data.azurerm_key_vault.keyvault_data
}


resource "azurerm_key_vault_secret" "key_secret_password"{
  name         = "bankadminpassword"
  value        = "khul_ja_simsim"
  key_vault_id = data.azurerm_key_vault.keyvault_data
}
