locals {
  env = substr(var.info.environment, 0, 1)

  name   = replace(module.naming.resource_group.name, "-", "")
  length = module.naming.resource_group.max_length - 4
  prefix = substr(local.name, 0, local.length)
}

resource azurerm_resource_group resource_group {
  name     = format("%s%s%03d", local.prefix, local.env, var.info.sequence)
  location = var.region

  tags = local.tags
}
