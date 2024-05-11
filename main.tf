#########################################################################
########################## EXEMPLE HOW TO USE ###########################
#########################################################################


module "virtual-network" {
  source = "./virtual-network"

  name_resource_group = "LAB"
  name_prefix         = "application"

  vnet_cidr = "10.0.0.0/16"

  backend_subnet_cidr  = "10.0.10.0/24"
  frontend_subnet_cidr = "10.0.20.0/24"
  database_subnet_cidr = "10.0.30.0/24"
  bastion_subnet_cidr  = "10.0.40.0/27"

  common_tags = {
    Environment = "Dev"
    Owner       = "Paulo H"
    Department  = "DevOps"
  }
}