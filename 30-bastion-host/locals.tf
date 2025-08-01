locals {
  resource_name = "${var.project_name}-${var.environment}-bastion"
  bastion_host_sg_id = data.aws_ssm_parameter.bastion_host_sg.value