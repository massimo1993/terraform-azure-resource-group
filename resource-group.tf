resource azurerm_resource_group resource_group {
  name = format("%s-%s-%03d",
    substr(
      module.naming.resource_group.name, 0,
      module.naming.resource_group.max_length - 4
    ),
    local.environment,
    var.info.sequence
  )

  location = var.region
  tags     = local.tags
}
