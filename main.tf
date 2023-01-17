resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = var.prefix
  tags = var.agents_tags

  default_node_pool {
    name       = var.default_node_pool_name
    node_count = var.agents_count
    vm_size    = var.agents_size
  }

  identity {
    type = var.identity_type
  }
}

resource "helm_release" "ingress_controller" {
  depends_on       = [azurerm_kubernetes_cluster.aks]
  name             = "nginx-controller"
  repository       = "https://kubernetes.github.io/ingress-nginx/"
  chart            = "ingress-nginx"
  namespace        = "ingress-basic"
  create_namespace = true
}



#az aks get-credentials --resource-group terraform-aks --name aks
#helm upgrade --install nginx helm/app