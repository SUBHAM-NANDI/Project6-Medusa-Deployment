provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

terraform {
  backend "s3" {
    bucket = "subham-medusa-terraform-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
