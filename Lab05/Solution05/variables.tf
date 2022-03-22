#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*      Creando una subnet en Azure - Variables      *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

# Service Principal Variables (Again, the bad way!)

variable "client_id" {
    description =   "Client ID (APP ID) del SPN"
    type        =   string
}

variable "client_secret" {
    description =   "Client Secret (Password) del SPN"
    type        =   string
}

variable "subscription_id" {
    description =   "Subscription ID"
    type        =   string
}

variable "tenant_id" {
    description =   "Tenant ID"
    type        =   string
}

# Resource Group Variables

variable "resource_group_name" {
    description =   "Nombre del RSG"
    type        =   string
    default     =   "Collabnix-RG"
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