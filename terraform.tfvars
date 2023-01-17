resource_group_name = "terraform-aks"

location = "eastus"

cluster_name = "aks"

prefix = "aksdns"

default_node_pool_name = "default"

agents_count = 1

agents_size = "Standard_B2s"

identity_type = "SystemAssigned"

agents_tags = {"Environment" = "Production"}

