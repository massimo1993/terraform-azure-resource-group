output name {
  description = "Generated name for the resource group."
  value       = azurerm_resource_group.resource_group.name
}

output id {
  description = "The ID of the resource group."
  value       = azurerm_resource_group.resource_group.id
}
