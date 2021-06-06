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

variable info {
  type = object({
    project     = string
    environment = string
    sequence    = number
  })

  description = "Info object used to construct naming convention for the resource group."

  validation {
    condition     = length(var.info.project) <= 79
    error_message = "Maximum of 79 characters allowed."
  }

  validation {
    condition = (
      can(regex("^[[:alnum:]]+$", var.info.project)) &&
      can(regex("^[[:alnum:]]+$", var.info.environment))
    )

    error_message = "Invalid character, alphanumeric values are supported."
  }

  validation {
    condition     = var.info.sequence > 0 && var.info.sequence <= 999
    error_message = "Sequence number must be between 1 and 999."
  }
}

variable tags {
  type        = map(string)
  description = "Tags object used to tag the resource group."

  validation {
    condition = length([
      for key, value in var.tags : true
        if length(key) <= 512

    ]) == length(var.tags)

    error_message = "Tag name must not exceed 512 characters."
  }

  validation {
    condition = length([
      for key, value in var.tags : true
        if length(value) <= 256

    ]) == length(var.tags)

    error_message = "Tag value must not exceed 256 characters."
  }

  validation {
    condition = length([
      for key, value in var.tags : true
        if can(regex("^[[:alnum:]]+$", key)) &&
           can(regex("^[[:alnum:]]+$", value))

    ]) == length(var.tags)

    error_message = "Invalid character, alphanumeric values are supported."
  }
}

variable region {
  type        = string
  description = "Region where the resource group will be created."
}
