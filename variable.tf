variable "aws_region" {
  description = "AWS region"
  type = string
  default = "ap-northeast-2"
}

variable "aws_access_key" {
  description = "access key for aws"
  type = string
  sensitive = true
}

variable "aws_secret_key" {
  description = "secret key for aws region"
  type = string
  sensitive = true
}

variable "azure_client_id" {
  description = "client_id for azure region"
  type = string
  sensitive = true
}

# variable "azure_client_secret" {
#   description = "secret id for azure region"
#   type = string
#   sensitive = true
# }

variable "tenant_id" {
  description = "client_id for azure region"
  type = string
  sensitive = true
}

variable "location" {
  description = "azure region"
  type = string
  default = "value"
}

variable "admin_ssh_key" {
  description = "ssh key"
  type = string
  default = "value"
}

variable "resource_group_name" {
  description = "resource grouop name"
  type = string
  default = "value"
}
