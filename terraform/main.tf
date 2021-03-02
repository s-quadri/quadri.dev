########################################
# STATE
########################################
terraform {
  backend "s3" {
    bucket         = "arda.at"
    key            = "terraform/sophia.quadri.dev.tfstate"
    dynamodb_table = "terraform-state-lock"
    region         = "us-west-1"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2"
    }
  }
}

########################################
# PROVIDERS
########################################
provider "aws" {
  region = "us-east-1"
}
