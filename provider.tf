terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
    backend "azurerm" {
        resource_group_name  = "terraform-storage-rg"
        storage_account_name = "terraformstate43241"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
    } 

}

provider "azurerm" {
  features {}
}

data "azurerm_kubernetes_cluster" "aks" {
  depends_on          = [azurerm_kubernetes_cluster.aks]
  name                = azurerm_kubernetes_cluster.aks.name
  resource_group_name = azurerm_kubernetes_cluster.aks.resource_group_name
}

provider "helm" {
  debug   = true
  kubernetes {
    host = data.azurerm_kubernetes_cluster.aks.kube_config[0].host

    client_key             = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config[0].client_key)
    client_certificate     = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate)
    cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate)
  }
}