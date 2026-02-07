terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "local" {}
}

provider "aws" {
  region = var.aws_region
}

module "ecr_orders" {
  source = "../../modules/ecr"
  name   = "${var.project_name}-orders"
}

module "ecr_payments" {
  source = "../../modules/ecr"
  name   = "${var.project_name}-payments"
}

module "ecr_inventory" {
  source = "../../modules/ecr"
  name   = "${var.project_name}-inventory"
}
