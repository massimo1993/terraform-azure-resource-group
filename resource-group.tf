resource azurerm_resource_group resource_group {
  name = format("%s%s%03d",
    substr(
      replace(module.naming.resource_group.name, "-", ""),
      module.naming.resource_group.max_length - 4
    ),
    substr(var.info.environment, 0, 1),
    var.info.sequence
  )

  location = var.region
  tags     = local.tags
}
