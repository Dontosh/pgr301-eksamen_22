terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.40.0"
    }
  }
  backend "s3" {
    bucket = "pgr301-exam-1049-terraform-state"
    key    = "no.shoppifly/CddemoApplication-state.state"
    region = "eu-north-1"
  }
}