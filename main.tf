provider "azurerm" {
  //version = "~>2.0"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name = "Learning"
  location = "Central US"
}

# Your Terraform code goes here...
resource "azurerm_container_group" "cg" {
  name                      = "weatherapi"
  location                  = azurerm_resource_group.rg.location
  resource_group_name       = azurerm_resource_group.rg.name

  ip_address_type     = "public"
  dns_name_label      = "hujirong"
  os_type             = "Linux"

  container {
      name            = "weatherapi"
      image           = "hujirong/weatherapi"
        cpu             = "1"
        memory          = "1"

        ports {
            port        = 80
            protocol    = "TCP"
        }
  }
}