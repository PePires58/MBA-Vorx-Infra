terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.54.0",
    }
  }

  required_version = ">=0.14.9"

  backend "s3" {
    bucket = "vorx-tf-artifacts"
    key    = ""
    region = "east-us-1"
  }
}

provider "aws" {
  region  = "us-east-1"
  version = "~>3.0"
}
