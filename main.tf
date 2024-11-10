terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.73.0"
    }
    azurerm = {
        source = "hashicorp/azurerm"
        version = "4.7.0"
    }
  }
}

# provider "azurerm" {
#    configuration option
# } 

provider "aws" {
    region = var.aws_region
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}

module "aws" {
  source = "./aws"
}

provider "azurerm" {
  # resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}

  subscription_id = "a4d417d6-4b7d-4dbc-8702-15f88c83dc21"
}
module "azure" {
  source = "./azure"
}