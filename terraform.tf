terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.15.0"
    }
  }

  backend "s3" {
    bucket = "metroc-terraform-2024"
    key    = "class5/aws-cad-tf-project/terraform.tfstate"
    region = "ca-central-1"
  }
}