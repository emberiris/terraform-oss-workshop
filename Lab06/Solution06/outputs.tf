#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*       Creando una subnet en Azure - Outputs       *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

output "resource-group-name" {
    description     =   "Nombre del RSG"
    value           =   azurerm_resource_group.rg.name
}

output "resource-group-location" {
    description     =   "Geolocalización del RSG"
    value           =   azurerm_resource_group.rg.location
}

output "virtual-network-name" {
    description     =   "Nombre de la VNet"
    value           =   azurerm_virtual_network.vnet.name
}

output "virtual-network-ip-range" {
    description     =   "CIDR de la VNet"
    value           =   azurerm_virtual_network.vnet.address_space
}

output "subnet-name" {
    description     =   "Nombre de la subnet"
    value           =   azurerm_subnet.sn.name
}

output "subnet-ip-range" {
    description     =   "CIDR de la subnet"
    value           =   [azurerm_subnet.sn.address_prefixes]
}