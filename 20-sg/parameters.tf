resource "aws_ssm_parameter" "mysql_sg" {
  name        = "/${var.project_name}/${var.environment}/mysql-sg"
  description = "Security Group for MySQL"
  type        = "String"
  value       = module.mysql_sg.id
  
}
resource "aws_ssm_parameter" "backend_sg" {
  name        = "/${var.project_name}/${var.environment}/backend-sg"
  description = "Security Group for Backend"
  type        = "String"
  value       = module.backend_sg.id
  
}
resource "aws_ssm_parameter" "frontend_sg" {
  name        = "/${var.project_name}/${var.environment}/frontend-sg"
  description = "Security Group for Frontend"
  type        = "String"
  value       = module.frontend_sg.id
  
}
resource "aws_ssm_parameter" "bastion_sg" {
  name = "/${var.project_name}/${var.environment}/bastion_host_sg"
  description = "Security Group for bastion"
  type = "String"
  value = module.bastion_sg.id
}
resource "aws_ssm_parameter" "ansible_sg" {
  name = "/${var.project_name}/${var.environment}/ansible_sg"
  description = "Security Group for bastion"
  type = "String"
  value = module.bastion_sg.id
}