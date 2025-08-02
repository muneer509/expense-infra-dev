locals {
  resource_name = "${var.project_name}-${var.environment}"
  mysql_sg_id = data.aws_ssm_parameter.mysql_sg.value
  public_subnet_id = split(",", data.aws_ssm_parameter.public_subnet_ids.value)[0]
  db_subnet_id = split(",", data.aws_ssm_parameter.db_subnet_ids.value)[0]
  backend_subnet_id = split(",", data.aws_ssm_parameter.backend_subnet_ids.value)[0]
  backend_sg_id =data.aws_ssm_parameter.backend_sg.value
  frontend_subnet_id = split(",", data.aws_ssm_parameter.frontend_subnet_ids.value)[0]
  
}