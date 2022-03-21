#
# - Provider Block
#

provider "azurerm" {
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