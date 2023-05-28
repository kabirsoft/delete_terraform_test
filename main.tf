provider "azurerm" {   
  features {}
}


resource "azurerm_resource_group" "terraform_demo_del1" {
  name = "terraform_rg_demo_del1"
  location = "Norway East"
}

resource "azurerm_container_group" "terraform_cg_demo_del1"{
  name = "weatherapidel1"
  location = azurerm_resource_group.terraform_demo_del1.location
  resource_group_name = azurerm_resource_group.terraform_demo_del1.name
  ip_address_type = "Public"
  dns_name_label = "terraformDemoWapidel1"
  os_type = "Linux"

  container {
    name = "weatherapidel1"
    image = "kabsoft/del1_weatherapi"
    cpu = "1"
    memory = "1"

    ports {
      port = 80
      protocol = "TCP"
    }
  }
}