# terraform-azurerm-log-analytics
Deploy an Azure Log Analytics Workspace.

Can be deployed with the default configuration of:

      name                       = "log-workspace"
      location                   = "uksouth"
      resource_group_name        = "rg-logging"
      sku                        = "PerGB2018"
      retention_in_days          = 30
      daily_quota_gb             = 2
      internet_ingestion_enabled = true
      internet_query_enabled     = true


# Example Module Deployment

```
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "logging" {
  source  = "andrewCluey/log-analytics/azurerm"
  version = "0.1.0"
}

module "log_analytics" {
  source  = "andrewCluey/log-analytics/azurerm"
  version = "0.1.0"

  workspace = {
    name                       = "dev-log-workspace"
    location                   = "uksouth"
    resource_group_name        = azurerm_resource_group.logging.name
    sku                        = "PerGB2018"
    retention_in_days          = 32
    daily_quota_gb             = 1
    internet_ingestion_enabled = true
    internet_query_enabled     = true
  }
}
```

module "log-analytics" {
  source  = "andrewCluey/log-analytics/azurerm"
  version = "0.1.0"
  # insert the 1 required variable here
}

Technically, the workspace configuration is one variable, if you need to customise this deployment in any way (different name or retention period for example), then ALL inputs have to be specified. It is not possible (with this module) to only define the required inputs. This feature is availble with the katest version of Terraform but is currently experimental, so we have left this is being tested.  
