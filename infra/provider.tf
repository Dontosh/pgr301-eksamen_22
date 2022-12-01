terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.40.0"
    }
  }
  backend "s3" {
    bucket = "analytics-1049"
    key    = "no.shoppifly/terraform.state"
    region = "eu-west-1"
  }
}