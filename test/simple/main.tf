provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "logging" {
  name     = "rg-dev-logging"
  location = "uksouth"
}


module "log_analytics" {
  source = "../../"

  location            = "uksouth"
  resource_group_name = azurerm_resource_group.logging.name
  solution_plan_map   = local.solution_plan_map

  workspace = {
    name                       = "dev-log-workspace"
    sku                        = "PerGB2018"
    retention_in_days          = 32
    daily_quota_gb             = 1
    internet_ingestion_enabled = true
    internet_query_enabled     = true
  }
}