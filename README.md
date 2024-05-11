Recursos de redes Azure dinâmicos: Subnets, Bastion, Nat Gateway, NIC, Route Table, & Public IP.

## Como utilizar
Crie um Resource Group via CLI Azure:
```
az group create -l <localização> -n <nome_do_rg>
```

Após criar o Resource Group via Azure CLI, vá em variable "nome_do_resource_group" e defina o nome do RG que foi criado.

Tag padrão para os recursos. Em variable procure "common_tags" e mude os valores conforme você deseja. Exemplo:
```
variable "common_tags" {
  type        = map(string)
  description = "Common tags to be applied to resources"

  default = { 
    Environment = "Dev" // Ambiente
    Owner       = "Paulo H" // Nome do responsável por criar o recurso
    Department  = "DevOps" // Departamento do funcionário
  }
}
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.102.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_bastion_host.bastion](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host) | resource |
| [azurerm_nat_gateway.nat](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/nat_gateway) | resource |
| [azurerm_nat_gateway_public_ip_association.nat_pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/nat_gateway_public_ip_association) | resource |
| [azurerm_network_interface.nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_public_ip.pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_subnet_nat_gateway_association.nat_assc_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_nat_gateway_association) | resource |
| [azurerm_virtual_network.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name_resource_group"></a> [name\_resource\_group](#input\_vnet\_cidr) | name from Resource Group for Data Source | `string` | n/a | yes |
| <a name="input_backend_subnet_cidr"></a> [backend\_subnet\_cidr](#input\_backend\_subnet\_cidr) | CIDR block for the backend subnet (e.g., 10.0.0.0/24) | `string` | n/a | yes |
| <a name="input_bastion_subnet_cidr"></a> [bastion\_subnet\_cidr](#input\_bastion\_subnet\_cidr) | CIDR block for the bastion subnet (e.g., 10.0.0.0/27) | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags to be applied to resources | `map(string)` | n/a | yes |
| <a name="input_database_subnet_cidr"></a> [database\_subnet\_cidr](#input\_database\_subnet\_cidr) | CIDR block for the database subnet (e.g., 10.0.0.0/24) | `string` | n/a | yes |
| <a name="input_frontend_subnet_cidr"></a> [frontend\_subnet\_cidr](#input\_frontend\_subnet\_cidr) | CIDR block for the frontend subnet (e.g., 10.0.0.0/24) | `string` | n/a | yes |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Prefix for create name resources | `string` | n/a | yes |
| <a name="input_vnet_cidr"></a> [vnet\_cidr](#input\_vnet\_cidr) | CIDR block for the Virtual Network (e.g., 10.0.0.0/16) | `string` | n/a | yes |


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name_subnets"></a> [name\_subnets](#output\_name\_subnets) | ID's from all Subnets |
| <a name="output_name_vnet"></a> [name\_vnet](#output\_name\_vnet) | Name from VNET |
| <a name="output_name_resource_group"></a> [name\_resource\_group](#output\_name\_resource\_group) | Name from Resource Group |
