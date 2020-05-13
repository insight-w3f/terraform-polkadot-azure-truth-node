#####
# Azure
#####
variable "azure_resource_group_name" {
  description = "Name of Azure Resource Group"
  type        = string
}
variable "public_subnet_id" {
  description = "The id of the subnet."
  type        = string
}

variable "private_subnet_id" {
  description = "The id of the subnet."
  type        = string
}

variable "application_security_group_id" {
  description = "The id of the application security group to run in"
  type        = string
}

variable "network_security_group_id" {
  description = "The id of the network security group to run in"
  type        = string
}

variable "node_name" {
  description = "Name of the node"
  type        = string
  default     = ""
}

variable "root_volume_size" {
  description = "Root volume size"
  type        = string
  default     = 0
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "Standard_A2_v2"
}

variable "public_key_path" {
  description = "The public ssh key path"
  type        = string
  default     = ""
}

variable "private_key_path" {
  description = "Path to private key"
  type        = string
  default     = ""
}

variable "chain" {
  description = "Which Polkadot chain to join"
  type        = string
  default     = "kusama"
}

variable "ssh_user" {
  description = "Username for SSH"
  type        = string
  default     = "ubuntu"
}

variable "project" {
  description = "Name of the project for node name"
  type        = string
  default     = "project"
}

variable "region" {
  description = "The AWS region where the bucket should be located"
  type        = string
  default     = "us-east-1"
}