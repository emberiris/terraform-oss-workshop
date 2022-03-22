#
# - Provider Block
#

provider "azurerm" {
    
    client_id       =   var.client_id
    client_secret   =   var.client_secret
    subscription_id =   var.subscription_id
    tenant_id       =   var.tenant_id
    
    features {}
}

#
# - Create a Resource Group
#

resource "azurerm_resource_group" "rg" {
    name                  =   "${var.prefix}-rg"
    location              =   var.location
    tags                  =   var.tags
}