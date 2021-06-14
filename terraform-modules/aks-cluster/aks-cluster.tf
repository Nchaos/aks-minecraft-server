resource "azurerm_resource_group" "default" {
  name     = "nc-games"
  location = "South Central US"
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = "aks-${var.akscluster}"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = "${var.akscluster}-k8s"

  default_node_pool {
    name            = "default"
    node_count      = 1
    vm_size         = "Standard_D2_v2"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = "var.appId"
    client_secret = "var.password"
    
  }

  role_based_access_control {
    enabled = true
  }

  tags = {
    environment = "dev"
  }
}
