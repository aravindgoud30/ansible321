provider "aws" {
  profile      = "default"
  region       = "ap-south-1"
  version      = "3.74.0"
}

terraform {
  backend "s3"{
    bucket = "terraform-b60"
    key    = "example/sample/terraform.tfstate"
    region = "ap-south-1"
  }
}

module "ec2" {
  source = "./ec2"
  SGID   = "module.sg.SGID"
}

module "sg" {
  source = "/.ssecurity_gropup"
}

output "public_ip" {
  value = module.ec2.public_ip
}