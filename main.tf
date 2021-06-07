

resource "azurerm_log_analytics_workspace" "workspace" {
  name                       = var.workspace.name
  location                   = var.workspace.location
  resource_group_name        = var.workspace.resource_group_name
  sku                        = var.workspace.sku
  retention_in_days          = var.workspace.retention_in_days
  daily_quota_gb             = var.workspace.daily_quota_gb
  internet_ingestion_enabled = var.workspace.internet_ingestion_enabled
  internet_query_enabled     = var.workspace.internet_query_enabled 
  
  tags = var.tags
}


variable "workspace" {
  type        = object
  description = "Input object t define a log analytics workspace"
  default     = {
      name                       = "log_workspace"
      location                   = "uksouth"
      resource_group_name        = "rg-logging"
      sku                        = "PerGB2018"
      retention_in_days          = 30
      daily_quota_gb             = 2
      internet_ingestion_enabled = true
      internet_query_enabled     = true
  }
}

variable "tags" {
  type        = string
  description = "Tags to apply to the new Log Analytics Workspace"
}




