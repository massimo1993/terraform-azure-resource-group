output name {
  description = "Generated name of the resource group."
  value       = module.resource_group.name
}

output region {
  description = "Region where the resource group will be created."
  value       = module.resource_group.region
}

output id {
  description = "The ID of the resource group."
  value       = module.resource_group.id
}
