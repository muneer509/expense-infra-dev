module "vpc" {
  source = "git::https://github.com/muneer509/terraform-aws-vpc.git?ref=main"
  project_name = "expense"
  environment = "qa"
  vpc_cidr = "192.168.0.0/16"
  public_subnet_cidrs = ["192.168.1.0/24","192.168.2.0/24"]
  private_subnet_cidrs = ["192.168.11.0/24","192.168.12.0/24"]
  database_subnet_cidrs = ["192.168.21.0/24","192.168.22.0/24"]
  common_tags = {
    terraform ="true"
    component = "VPC"
  }
  
}