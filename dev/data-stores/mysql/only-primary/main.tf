terraform {
  required_version = ">= 1.0.0, < 2.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

module "mysql" {
  source      = "../../../../../modules/data-stores/mysql"
  name        = var.name
  db_username = var.db_username
  db_password = var.db_password
  env_name    = "dev"
  db_name     = "library"
  table       = "books"
}

