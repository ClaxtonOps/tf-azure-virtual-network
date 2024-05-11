output "name_resource_group" {
    value = data.azurerm_resource_group.rg.name
}

output "name_vnet" {
  value = azurerm_virtual_network.main.name
}

output "name_subnets" {
  value = azurerm_virtual_network.main.subnet[*].id
}
