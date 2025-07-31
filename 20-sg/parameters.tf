resource "aws_ssm_parameter" "mysql_sg" {
  name        = "/${var.project_name}/${var.environment}/mysql-sgs"
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