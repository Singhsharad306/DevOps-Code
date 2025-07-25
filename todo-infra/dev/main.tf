module "resource_group" {
  source        = "../../Module/azurerm_resource_group"
  resource_name = "rg-banking-app"
  location      = "eastus"
}


module "virtul_net" {
  source              = "../../Module/azurerm_vnet"
  vnet_name           = "krishna-dev-vnet"
  location            = "eastus"
  resource_group_name = "rg-banking-app"
  address_space       = ["10.0.0.0/16"]
}


module "azurerm_subnet_frountend" {
  depends_on           = [module.virtul_net, module.resource_group]
  source               = "../../Module/arurerm_subnet"
  subnet_name          = "frount_subnet"
  resource_group_name  = "rg-banking-app"
  virtual_network_name = "krishna-dev-vnet"
  address_prefixes     = ["10.0.1.0/24"]

}

module "azurerm_subnet_backend" {
  depends_on           = [module.virtul_net, module.resource_group]
  source               = "../../Module/arurerm_subnet"
  subnet_name          = "backend_subnet"
  resource_group_name  = "rg-banking-app"
  virtual_network_name = "krishna-dev-vnet"
  address_prefixes     = ["10.0.2.0/24"]

}

module "publice_ip" {
  source                  = "../../Module/azurerm_public_ip"
  name                    = "krishna_airtel"
  resource_group_location = "eastus"
  resource_group_name     = "rg-banking-app"
}



# module "nic" {
#     source = "../../Module/azurerm.nic"
#     name = "tower1"
#     location = "eastus"
#     resource_group = "rg-banking-app"

# }


module "vm" {

  depends_on           = [module.key_vault, module.azurerm_subnet_frountend, module.publice_ip, module.resource_group]
  source               = "../../Module/azurerm_virtual_machine"
  nic_name             = "tower1"
  location             = "eastus"
  resource_group_name  = "krishna-dev-vnet"
  nsg_name             = "victory_security"
  security_rule_name   = "tast1"
  vm_name              = "royal_vm"
  size                 = "Standard_F2"
  username             = data.azurerm_key_vault_secret.key_secret_admin.value
  password             = data.azurerm_key_vault_secret.key_secret_password
  publisher            = "Canonical"
  offer                = "0001-com-ubuntu-server-jammy"
  sku                  = "22_04-lts"
  subnet_id            = data.azurerm_subnet.frount_subnet
  public_ip_address_id = data.azurerm_public_ip.pip





}

module "key_vault" {
  source              = "../../Module/key_vault"
  key_vault_name      = "bank_lokar"
  resource_group_name = "krishna-dev-vnet"
  location            = "eastus"
  key_admin           = "bankadmin"
  key_password        = "bankadminpassword"



}


