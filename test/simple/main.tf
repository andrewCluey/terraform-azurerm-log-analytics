resource "azurerm_resource_group" "logging" {
  name     = "rg-dev-logging"
  location = "uksouth"
}

module "log_analytics" {
    source = "../../"

    workspace = {
        name                       = "dev-log_workspace"
        location                   = "uksouth"
        resource_group_name        = azurerm_resource_group.logging.name
        sku                        = "PerGB2018"
        retention_in_days          = 7
        daily_quota_gb             = 1
        internet_ingestion_enabled = true
        internet_query_enabled     = true
    }
}