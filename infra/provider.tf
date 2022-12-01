terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.40.0"
    }
  }
  backend "s3" {
    bucket = "1049-state-bucket"
    key    = "no.shoppifly/terraform.state"
    region = "eu-west-1"
  }
}