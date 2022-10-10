terraform {
  required_version = ">= 1.2.4"
  required_providers {
    aws = {
      version = ">= 4.34.0"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

## proposed provider

# provider "aws" {
#   region              = "us-east-1"
#   allowed_account_ids = "456789101112" # development account
#   assume_role {
#     role_arn     = "arn:aws:iam::456789101112:role/deployment" # assumed execution role allowed to create required resources.
#     session_name = "deployment-infrastructure-terraform"
#   }
# }