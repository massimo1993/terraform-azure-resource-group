locals {
  prefix = "rg-${local.project}"

  offset = 0
  length = 3

  env = substr(local.environment, local.offset, local.length)
}

resource azurerm_resource_group resource_group {
  name = format("%s-%s-%03d", local.prefix, local.env, var.info.sequence)

  location = var.region
  tags     = local.tags
}
