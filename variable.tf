variable "vmname" {}
variable "key_name" {}
variable "subnet_id" {}
variable "ami" {}
variable "instance_type" {}
variable "vpc_id" {}
variable "additional_tags" {
  default = {
    ProvisionBy = "Terraform"
  }

}
variable "ports" {
  default = {
    "443" = ["0.0.0.0/0"]
    "22"  = ["0.0.0.0/0"]
    "80"  = ["0.0.0.0/0"]
  }
}
