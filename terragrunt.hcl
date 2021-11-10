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
  region                    = "us-east-2"
  eks_cluster_name          = "devops-cluster"          # expect your input
  environment               = "dev"                     # expect your input
  vpc_cidr_block            = "10.68.0.0/16"
  worker-node-ssh-key       = "keyfile"                 # expect your input
  worker-node-max-size      = 3                         # expect your input
  worker-node-min-size      = 1                         # expect your input
  worker-node-desire-size   = 2                         # expect your input
  worker-node-instance-type = "t2.medium"               # expect your input
  worker-node-disk-size     = 250                       # expect your input
}


remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "s3bucketname"                     # Bucket name required
    key            = "dodonotdo/dev/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
  }
}
