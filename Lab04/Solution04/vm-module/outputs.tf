
output "linux_nic_name" {
    value           =   azurerm_network_interface.nic.name
}

output "public_ip_address" {
    value           =   azurerm_public_ip.pip.ip_address
}

output "linux_vm_login" {  #ESTE OUTPUT ES SOLO CON FINES ACADEMICOS, NO LO USES DE FORMA NORMAL, NO QUIERES TENER TUS CREDENCIALES EN TEXTO PLANO SOBRE UN LOG (supongo...)
    value           = {
        "username"  =   azurerm_linux_virtual_machine.vm.admin_username
        "password"  =   azurerm_linux_virtual_machine.vm.admin_password
    }  
}