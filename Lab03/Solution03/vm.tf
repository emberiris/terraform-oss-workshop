#
# - Create a Network Interface Card for Virtual Machine
#

resource "azurerm_network_interface" "nic" {
    count                             =   2
    name                              =   "${var.prefix}-linuxvm-nic${count.index + 1}"
    resource_group_name               =   azurerm_resource_group.rg.name
    location                          =   azurerm_resource_group.rg.location
    tags                              =   var.tags
    ip_configuration                  {
        name                          =  "${var.prefix}-nic-ipconfig${count.index + 1}"
        subnet_id                     =   azurerm_virtual_network.vnet.subnet.*.id[count.index]
        public_ip_address_id          =   azurerm_public_ip.pip.*.id[count.index]
        private_ip_address_allocation =   var.allocation_method[1]
    }
}


#
# - Create a Linux Virtual Machine
# 

resource "azurerm_linux_virtual_machine" "vm" {
    count                             =   2
    name                              =   "${var.prefix}-linuxvm${count.index + 1}"
    resource_group_name               =   azurerm_resource_group.rg.name
    location                          =   azurerm_resource_group.rg.location
    network_interface_ids             =   [azurerm_network_interface.nic.*.id[count.index]]
    size                              =   var.virtual_machine_size
    computer_name                     =   var.computer_name
    admin_username                    =   var.admin_username
    admin_password                    =   var.admin_password
    disable_password_authentication   =   false

    os_disk  {
        name                          =   "${var.prefix}-linuxvm-os-disk"
        caching                       =   var.os_disk_caching
        storage_account_type          =   var.os_disk_storage_account_type
        disk_size_gb                  =   var.os_disk_size_gb
    }

    source_image_reference {
        publisher                     =   var.publisher
        offer                         =   var.offer
        sku                           =   var.sku
        version                       =   var.vm_image_version
    }

    tags                              =   var.tags

}

resource "azurerm_managed_disk" "disk" {
  count                = 2
  name                 = "${azurerm_linux_virtual_machine.vm.*.name[count.index]}-disk1"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
}

resource "azurerm_virtual_machine_data_disk_attachment" "disk_attachment" {
  count              = 2
  managed_disk_id    = azurerm_managed_disk.disk.*.id[count.index]
  virtual_machine_id = azurerm_linux_virtual_machine.vm.*.id[count.index]
  lun                = "10"
  caching            = "ReadWrite"
}