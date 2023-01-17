provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3"{
    bucket = "terraform-state-igti-bruno"
    key    = "state/igti/eng_dados_cloud/mod1/terraform.tfstate"
    region = ""
  }
}