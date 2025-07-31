module "mysql_sg" {
  source = "git::https://github.com/daws-81s/terraform-aws-security-group.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  sg_name = "mysql"
  vpc_id =  local.vpc_id
  common_tags = {
    terraform = "true"
    component = "expense"
  }

}
module "backend_sg" {
  source = "git::https://github.com/daws-81s/terraform-aws-security-group.git?ref=main"
  project_name = var.project_name
  environment = var.environment 
  sg_name = "backend"
  vpc_id = local.vpc_id 
  common_tags = {
    terraform = "true"
    component = "expense"
  }
}
module "frontend_sg" {
  source = "git::https://github.com/daws-81s/terraform-aws-security-group.git?ref=main"
  project_name = var.project_name
  environment = var.environment   
  sg_name = "frontend"
  vpc_id = local.vpc_id   
  common_tags = {
    terraform = "true"
    component = "expense"
  } 
  
}