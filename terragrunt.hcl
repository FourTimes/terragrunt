terraform {
  source = "github.com/FourTimes/terragrunt.git//module/instance"
  # extra_arguments "common_vars" {
  #   commands = ["plan", "apply"]
  #   arguments = [
  #     "-var-file=config.tfvars"
  #   ]
  # }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
    provider "aws" {
      region = "us-east-2"
    }
EOF
}


inputs = {
  vmname              ="demo"
  key_name            ="vanguard"
  subnet_id           ="id=subnet-048b89ba98c2f5fbc"
  ami                 ="ami-0567f647e75c7bc05"
  instance_type       ="t2.micro"
  vpc_id              ="vpc-0fa4b46fd1331345b"
  additional_tags     =   {
                          ProvisionBy = "Terraform"
                          Environment = "development"
                          }
  ports               =  {
                          "443"  = ["0.0.0.0/0"]
                          "22"   = ["0.0.0.0/0"]
                          "80"   = ["0.0.0.0/0"]
                      }
}