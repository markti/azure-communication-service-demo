resource "random_string" "random" {
  length           = 6
  special          = false
}

locals {
  suffix = random_string.random.result
}

resource "azurerm_resource_group" "main" {
  name     = "rg-acs-demo-${local.suffix}"
  location = "East US"
}

resource "azurerm_communication_service" "main" {
  name                = "acs-demo-${local.suffix}"
  resource_group_name = azurerm_resource_group.main.name
  data_location       = "United States"
}
