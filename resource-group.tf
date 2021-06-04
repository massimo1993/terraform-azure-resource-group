locals {
  prefix = "rg-${local.project}"

  offset     = 0
  max_length = 90 - 6
}

resource azurerm_resource_group resource_group {
  name = replace(
    format("%s-%s-%03d",
      substr(local.prefix, local.offset, local.max_length),
      substr(local.environment, local.offset, 3),
      var.info.sequence
    ), " ", ""
  )

  location = var.region
  tags     = local.tags
}
