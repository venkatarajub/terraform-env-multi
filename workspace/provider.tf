terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    }
    backend "s3" {
        bucket = "ven-remote-dev"
        key    = "workspace"
        region = "us-east-1"
        dynamodb_table = "ven-dev-locking"
    
    }
  
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}