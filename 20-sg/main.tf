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
resource "aws_security_group_rule" "mysql_to_backend" {
  type = "ingress"
  from_port = 3306
  to_port = 3306  
  protocol = "tcp"
  security_group_id = module.mysql_sg.id
  source_security_group_id = module.backend_sg.id
  description = "Allow MySQL traffic from Backend"  

}
resource "aws_security_group_rule" "backend_to_frontend" {
  type = "ingress"
  from_port = 8080
  to_port = 8080
  protocol = "tcp"
  source_security_group_id = module.frontend_sg.id
  security_group_id = module.backend_sg.id


}