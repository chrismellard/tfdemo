resource "azurerm_app_service_plan" "default" {
  name                = "appserviceplan-pro"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "default" {
  name                = "cm-app-service-8657"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  app_service_plan_id = azurerm_app_service_plan.default.id

  site_config {
    linux_fx_version = "DOCKER|nginxdemos/hello"
  }


}
