
# Prefix and Tags

variable "prefix" {
    description =   "Prefix to append to all resource names"
    type        =   string
    default     =   ""
}

variable "rsg_name" {
    description =   "Name of the Resource group"
    type        =   string
    default     =   ""
}

variable "vnet_name" {
    description =   "Name of the Virtual Netowrk"
    type        =   string
    default     =   ""
}

variable "subnet_name" {
    description =   "Name of the Subnet"
    type        =   string
    default     =   ""
}

variable "tags" {
    description =   "Resouce tags"
    type        =   map(string)
    default     =   {
        "project"       =   "Terraform_OSS_Workshop"
    }
}

# Public IP and NIC Allocation Method

variable "allocation_method" {
    description =   "Allocation method for Public IP Address and NIC Private ip address"
    type        =   list(string)
    default     =   ["Static", "Dynamic"]
}

# VM 

variable "name" {
    description =   "Name of the VM"
    type        =   string
    default     =   "linuxvm"
}

variable "virtual_machine_size" {
    description =   "Size of the VM"
    type        =   string
    default     =   "Standard_B1s"
}

variable "computer_name" {
    description =   "Computer name"
    type        =   string
    default     =   "linuxvm"
}

variable "admin_username" {
    description =   "Username to login to the VM"
    type        =   string
    default     =   "linuxadmin"
}

variable "admin_password" {
    description =   "Password to login to the VM"
    type        =   string
    default     =   "P@$$w0rD2022*" 
}

variable "os_disk_caching" {
    default     =       "ReadWrite"
}

variable "os_disk_storage_account_type" {
    default     =       "StandardSSD_LRS"
}

variable "os_disk_size_gb" {
    default     =       64
}

variable "publisher" {
    default     =       "Canonical"
}

variable "offer" {
    default     =       "UbuntuServer"
}

variable "sku" {
    default     =       "16.04-LTS"
}

variable "vm_image_version" {
    default     =       "latest"
}