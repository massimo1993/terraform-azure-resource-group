# Environment variables should be used for authentication.
#
# ARM_SUBSCRIPTION_ID
# ARM_CLIENT_ID
# ARM_CLIENT_SECRET
# ARM_TENANT_ID
#
# ARM_ACCESS_KEY
#
# Reference the Azure Provider documentation for more information.
#
# https://www.terraform.io/docs/providers/azurerm/index.html

variable info {
  type = object({
    project     = string
    environment = string
    sequence    = string
  })

  description = "Info object used to construct naming convention for the resource group."
}

variable tags {
  type        = map(string)
  description = "Tags object used to tag the resource group."
}

variable region {
  type        = string
  description = "Region where the resource group will be created."
}
