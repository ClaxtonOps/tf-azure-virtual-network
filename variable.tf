variable "name_prefix" {
  type        = string
  description = "Prefix for create name resources"
  default     = "claxton"
}

variable "vnet_cidr" {
  type        = string
  description = "CIDR block for the Virtual Network (e.g., 10.0.0.0/16)"
  default     = "192.168.0.0/16"
}

variable "frontend_subnet_cidr" {
  type        = string
  description = "CIDR block for the frontend subnet (e.g., 10.0.0.0/24)"
  default     = "192.168.10.0/24"
}

variable "backend_subnet_cidr" {
  type        = string
  description = "CIDR block for the backend subnet (e.g., 10.0.0.0/24)"
  default     = "192.168.20.0/24"
}

variable "database_subnet_cidr" {
  type        = string
  description = "CIDR block for the database subnet (e.g., 10.0.0.0/24)"
  default     = "192.168.30.0/24"
}

variable "bastion_subnet_cidr" {
  type        = string
  description = "CIDR block for the bastion subnet (e.g., 10.0.0.0/27)"
  default     = "192.168.40.0/27"

  validation {
    condition     = can(regex("^(\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/27)$", var.bastion_subnet_cidr))
    error_message = "CIDR block must be in the format of IP address with /27 subnet mask (e.g., 10.0.0.0/27)"
  }
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags to be applied to resources"

  default = {
    Environment = "Dev"
    Owner       = "Paulo H"
    Department  = "DevOps"
  }
}
