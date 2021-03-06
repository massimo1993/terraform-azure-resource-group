output name {
  description = "Generated name of the resource group."
  value       = azurerm_resource_group.resource_group.name
}

output region {
  description = "Region where the resource group will be created."
  value       = azurerm_resource_group.resource_group.location
}

output id {
  description = "The ID of the resource group."
  value       = azurerm_resource_group.resource_group.id
}
