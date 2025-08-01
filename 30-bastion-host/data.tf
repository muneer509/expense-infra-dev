data "aws_ssm_parameter" "bastion_host_sg" {
  name = "/${var.project_name}/${var.environment}/bastion_host_sg"
  
}