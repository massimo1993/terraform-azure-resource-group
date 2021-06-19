# Environment variables should be used for authentication.
#
# ARM_SUBSCRIPTION_ID
# ARM_CLIENT_ID
# ARM_CLIENT_SECRET
# ARM_TENANT_ID
#
# Reference the Azure Provider documentation for more information.
#
# https://www.terraform.io/docs/providers/azurerm/index.html

provider azurerm {
  features {}
}

module resource_group {
  # When using the module in your own project, you will need to use
  # massimo1993/resource-group/azure as the source.
  source = "../../"

  info   = var.info
  region = var.region

  tags = var.tags
}
