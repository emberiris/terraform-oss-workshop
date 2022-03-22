# Service Principal Variables

variable "client_id" {
    description =   "Client ID (APP ID) of the application"
    type        =   string
}

variable "client_secret" {
    description =   "Client Secret (Password) of the application"
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


# Prefix and Tags

variable "prefix" {
    description =   "Prefix to append to all resource names"
    type        =   string
    default     =   "toki"
}

variable "tags" {
    description =   "Resouce tags"
    type        =   map(string)
    default     =   {
        "project"       =   "Terraform_OSS_Workshop"
    }
}

# Resource Group

variable "location" {
    description =   "Location of the resource group"
    type        =   string
    default     =   "westeurope"
}

# Vnet and Subnet

variable "vnet_address_range" {
    description =   "IP Range of the virtual network"
    type        =   string
    default     =   "10.0.0.0/16"
}

variable "subnet_address_range" {
    description =   "IP Range of the virtual network"
    type        =   string
    default     =   "10.0.1.0/24"
}


