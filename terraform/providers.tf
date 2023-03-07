terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.54.0",
    }
  }

  backend "s3" {
    bucket = "vorx-tf-artifacts"
    key    = ""
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}
