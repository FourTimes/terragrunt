terraform {
  source = "./module/instance"
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
  instanceName        ="vanguard"
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
