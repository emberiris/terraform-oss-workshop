#
# - Create local variables using locals block
#

locals {
  subnets = [
    {
      name           = "snet01"
      address_prefix = "10.0.1.0/24"
    },
 
    {
      name           = "snet02"
      address_prefix = "10.0.2.0/24"
    }
  ]
}

#
# - Create a Virtual Network and subnets using dynamic
#

resource "azurerm_virtual_network" "vnet" {
    name                  =   "${var.prefix}-vnet"
    resource_group_name   =   azurerm_resource_group.rg.name
    location              =   azurerm_resource_group.rg.location
    address_space         =   [var.vnet_address_range]

  dynamic "subnet" {
    for_each = local.subnets
 
    content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
    }
  }

    tags                  =   var.tags
}

#
# - Create a Network Security Group
#

resource "azurerm_network_security_group" "nsg" {
    name                        =       "${var.prefix}-web-nsg"
    resource_group_name         =       azurerm_resource_group.rg.name
    location                    =       azurerm_resource_group.rg.location
    tags                        =       var.tags

    security_rule {
    name                        =       "Allow_SSH"
    priority                    =       1000
    direction                   =       "Inbound"
    access                      =       "Allow"
    protocol                    =       "Tcp"
    source_port_range           =       "*"
    destination_port_range      =       22
    source_address_prefix       =       "PASTE_YOUR_IP_ADDRESS_HERE" 
    destination_address_prefix  =       "*"
    
    }
}


#
# - Subnet-NSG Association for both subnets
#


resource "azurerm_subnet_network_security_group_association" "subnet-nsg" {
    count                        =       2
    subnet_id                    =       azurerm_virtual_network.vnet.subnet.*.id[count.index]
    network_security_group_id    =       azurerm_network_security_group.nsg.id
}


#
# - Public IP (To Login to Linux VM)
#

resource "azurerm_public_ip" "pip" {
    count                           =     2
    name                            =     "${var.prefix}-linuxvm-public-ip${count.index + 1}"
    resource_group_name             =     azurerm_resource_group.rg.name
    location                        =     azurerm_resource_group.rg.location
    allocation_method               =     var.allocation_method[0]
    tags                            =     var.tags
}