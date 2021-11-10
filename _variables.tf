variable "eks_cluster_name" {}
variable "environment" {}
variable "vpc_cidr_block" {}
variable "private_subnet_cidr_block" {
  default = ["10.68.3.0/24", "10.68.4.0/24"]
}
variable "public_subnet_cidr_blocks" {
  default = ["10.68.1.0/24", "10.68.2.0/24"]
}
variable "availability_zones" {
  default = ["us-east-2a", "us-east-2b"]
}
variable "region" {}
variable "eks-cw-logging" {
  type    = list(any)
  default = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

variable "worker-node-ssh-key" {}
variable "worker-node-max-size" {}
variable "worker-node-min-size" {}
variable "worker-node-desire-size" {}
variable "worker-node-instance-type" {}
variable "worker-node-disk-size" {}
variable "additional_tags" {
  type        = map(string)
  description = "Additional tags."
  default = {
    ProvisionBy = "Terraform"
  }
}
