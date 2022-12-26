# Provider 
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.48.0"
    }
  }
}


# Region
provider "aws" {
  region = var.region
}
