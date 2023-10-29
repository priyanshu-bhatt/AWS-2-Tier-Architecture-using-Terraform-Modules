terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.67.0"
    }   
  }
#   backend "s3"{
#       bucket = "backend-priyanshu209"
#       key = "backend/terraform.tfstate"
#       region = "ap-south-1"
#       dynamodb_table = "backend-priyanshu209-lock"
#       encrypt = true
#   }
}

provider "aws" {
  # Configuration options
  region= var.region
}
