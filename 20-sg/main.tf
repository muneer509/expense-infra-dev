module "mysql_sg" {
  source = "git::https://github.com/daws-81s/terraform-aws-security-group.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  sg_name = local.sg_name
  vpc_id =  local.vpc_id
  common_tags = {
    terraform = "true"
    component = "expense"
  }

}