#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*      Creando una subnet en Azure - Variables      *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

# Resource Group Variables

variable "resource_group_name" {
    description =   "Nombre del RSG"
    type        =   string
    default     =   "TokiotaWorkshop-RSG"
}

variable "location" {
    description =   "Geolocalización de los recursos"
    type        =   string
    default     =   "westeurope"
}

variable "virtual_network_name" {
    description =   "Nombre de la VNet"
    type        =   string
    default     =   "TerraformOSSWorkshop-Vnet"
}

variable "vnet_address_range" {
    description =   "CIDR de la VNet"
    type        =   string
    default     =   "10.0.0.0/16"
}

variable "subnet_name" {
    description =   "Nombre de la subnet"
    type        =   string
    default     =   "Webserver-Subnet"
}

variable "subnet_address_range" {
    description =   "CIDR de la subnet"
    type        =   string
    default     =   "10.0.1.0/24"
}