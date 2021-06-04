terraform {
  backend "azurerm" {
    resource_group_name  = "rg-common-d001"
    storage_account_name = "stcommond001"
    container_name       = "terraform"
    key                  = "resource-group.tfstate"
    snapshot             = true
  }
}
