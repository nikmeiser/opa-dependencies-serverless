provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./vpc_module"
}

module "ec2_instance" {
  source        = "./ec2_module"
  instance_type = var.instance_type
  ami_id        = var.ami_id
  key_name      = var.key_name
  subnet_id     = module.vpc.public_subnet_id
  vpc_id        = module.vpc.vpc_id
}