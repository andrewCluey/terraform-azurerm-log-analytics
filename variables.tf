variable "location" {
  type        = string
  description = "The Azure Region where the resources should be deployed"
  default     = "uksouth"
}

variable "resource_group_name" {
  type        = string
  description = "The resource group where the resources should be stored."
}


variable "workspace" {
  type = object({
    name                       = string
    sku                        = string
    retention_in_days          = number
    daily_quota_gb             = number
    internet_ingestion_enabled = bool
    internet_query_enabled     = bool
  })
  description = "Input object to define a log analytics workspace"
  default = {
    name                       = "log-workspace"
    location                   = "uksouth"
    resource_group_name        = "rg-logging"
    sku                        = "PerGB2018"
    retention_in_days          = 30
    daily_quota_gb             = 2
    internet_ingestion_enabled = true
    internet_query_enabled     = true
  }
}

variable "solution_plan_map" {
  description = "(Optional) Map structure containing the list of solutions to be enabled."
  type        = map(any)
  default     = {}
}


variable "tags" {
  type        = map(string)
  description = "Tags to apply to the new Log Analytics Workspace"
  default     = null
}

