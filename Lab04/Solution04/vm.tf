module "vm"{
    source      = "./vm-module"

    name        = "a_vm_name"
    prefix      = "toki"
    rsg_name    = azurerm_resource_group.rg.name
    vnet_name   = azurerm_virtual_network.vnet.name
    subnet_name = azurerm_subnet.web.name  

    depends_on = [
      azurerm_resource_group.rg,
      azurerm_virtual_network.vnet,
      azurerm_subnet.web
    ]
}