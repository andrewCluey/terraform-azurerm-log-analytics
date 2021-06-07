
resource "azurerm_log_analytics_workspace" "workspace" {
  name                       = var.workspace.name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  sku                        = var.workspace.sku
  retention_in_days          = var.workspace.retention_in_days
  daily_quota_gb             = var.workspace.daily_quota_gb
  internet_ingestion_enabled = var.workspace.internet_ingestion_enabled
  internet_query_enabled     = var.workspace.internet_query_enabled

  tags = var.tags
}
output "la_id" {
  value = azurerm_log_analytics_workspace.workspace.id
}

resource "azurerm_log_analytics_solution" "la_solution" {
  for_each = var.solution_plan_map

  solution_name         = each.key
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.workspace.id
  workspace_name        = azurerm_log_analytics_workspace.workspace.name

  plan {
    product   = each.value.product
    publisher = each.value.publisher
  }
}