generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
    provider "aws" {
        region = "us-east-1"
      }
    EOF
}

inputs = {
  vmname              ="dodonotdo"
  key_name            ="dodonotdo"
  subnet_id           ="id=subnet-048b89ba98c2f5fbc"
  ami                 ="ami-0567f647e75c7bc05"
  instance_type       ="t2.micro"
  vpc_id              ="vpc-0fa4b46fd1331345b"

}


remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "tecton-ey-terrafrom-state"
    key = "dodonotdo/${get_terragrunt_dir()}/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
  }
}
