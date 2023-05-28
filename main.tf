provider "azurerm" {   
  features {}
}


resource "azurerm_resource_group" "terraform_demo_del1" {
  name = "terraform_rg_demo_del1"
  location = "Norway East"
}

terraform {   
  backend "azurerm" {
    resource_group_name = "tf_resourceGroup_blobstore2"
    storage_account_name = "tfstorageaccblobstore2"
    container_name = "tfstateblobstore2"
    key = "terraform.tfstate"
  }  
}

variable "imagebuild" {
  type        = string  
  description = "Latest image build"
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
    image = "kabsoft/del1_weatherapi:${var.imagebuild}"
    cpu = "1"
    memory = "1"

    ports {
      port = 80
      protocol = "TCP"
    }
  }
}