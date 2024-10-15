provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block    = "10.0.0.0/16"
  private_subnet    = ["10.0.1.0/24"]
  public_subnet     = ["10.0.2.0/24"]
  availability_zone = ["us-west-2a"]
}

module "ec2" {
  source = "./modules/ec2"

  ami                       = "ami-0688ba7eeeeefe3cd"
  instance_type             = "t2.micro"
  public_subnet_ids         = module.vpc.public_subnet_ids
  private_subnet_ids        = module.vpc.private_subnet_ids
  public_security_group_id  = module.security_groups.public_security_group_id
  private_security_group_id = module.security_groups.private_security_group_id
  key_name = "Group_17"
  public_key = file("~/.ssh/id_rsa.pub") // The public key on your computer
}

module "security_groups" {
  source = "./modules/security-groups"

  vpc_id                   = module.vpc.vpc_id
  allowed_ssh_ip           = "0.0.0.0/0"
  from_port_demand         = 22
  to_port_demand           = 22
}
