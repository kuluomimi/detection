terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4"
    }
  }
  backend "s3" {
    bucket = "nhsd-apim-gp-connect-pfs-access-record-terraform"
    region = "eu-west-2"
    key = "gpconnectpfs"
  }
}

provider "aws" {
  region  = "eu-west-2"
  profile = "apim-dev"
  default_tags {
    tags = {
      Project     = var.project
      Environment = local.environment
      Service     = var.service
    }
  }
}

provider "aws" {
  alias  = "acm_provider"
  region = "eu-west-2"
  profile = "apim-dev"
}
