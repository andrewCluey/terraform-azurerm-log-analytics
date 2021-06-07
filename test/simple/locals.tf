locals {
  solution_plan_map = {
    AgentHealthAssessment = {
      "publisher" = "Microsoft"
      "product"   = "OMSGallery/AgentHealthAssessment"
    },
    DnsAnalytics = {
      "publisher" = "Microsoft"
      "product"   = "OMSGallery/DnsAnalytics"
    },
    AzureSQLAnalytics = {
      "publisher" = "Microsoft"
      "product"   = "OMSGallery/AzureSQLAnalytics"
    },
    AzureNSGAnalytics = {
      "publisher" = "Microsoft"
      "product"   = "OMSGallery/AzureNSGAnalytics"
    },
    KeyVaultAnalytics = {
      "publisher" = "Microsoft"
      "product"   = "OMSGallery/KeyVaultAnalytics"
    }
  }
}