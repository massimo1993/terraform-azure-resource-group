resource azurerm_resource_group resource_group {
  name = format("%s-%s-%03d",
    substr(
      module.naming.resource_group.name, 0,
      module.naming.resource_group.max_length - 6
    ),
    substr(local.environment, 0, 3),
    var.info.sequence
  )

  location = var.region
  tags     = local.tags
}
