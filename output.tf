output "name_vnet" {
    value = azurerm_virtual_network.main.name
}

output "name_subnets" {
    value = tolist(azurerm_virtual_network.main.subnet)[*].id
}
