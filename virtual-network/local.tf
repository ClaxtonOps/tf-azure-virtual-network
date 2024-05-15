data "azurerm_resource_group" "rg" {
  name = var.name_resource_group
}

locals {
  prefix        = var.name_prefix
  address_space = [var.vnet_cidr]
  sku           = "Standard"

  vnetSubnets = {
    "backend" = {
      address_prefix = var.backend_subnet_cidr
      #security_group = azurerm_network_security_group.backend.id
    }
    "frontend" = {
      address_prefix = var.frontend_subnet_cidr
      #security_group = azurerm_network_security_group.frontend.id
    }
    "database" = {
      address_prefix = var.database_subnet_cidr
      #security_group = azurerm_network_security_group.database.id
    }
    "AzureBastionSubnet" = {
      address_prefix = var.bastion_subnet_cidr
    }
  }

  routes = {
    "frontend" = {
      address_prefix = "0.0.0.0/0"
      next_hop_type  = "Internet"
      subnet_id      = tolist(azurerm_virtual_network.main.subnet)[1].id
    }
    "backend" = {
      address_prefix = var.vnet_cidr
      next_hop_type  = "VnetLocal"
      subnet_id      = tolist(azurerm_virtual_network.main.subnet)[0].id

    }
    "database" = {
      address_prefix = var.vnet_cidr
      next_hop_type  = "VnetLocal"
      subnet_id      = tolist(azurerm_virtual_network.main.subnet)[2].id

    }
  }


}