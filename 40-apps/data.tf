# data "aws_ssm_parameter" "bastion_host_sg" {
#   name = "/${var.project_name}/${var.environment}/bastion_host_sg"
  
# }
data "aws_ssm_parameter" "mysql_sg" {
  name = "/${var.project_name}/${var.environment}/mysql-sg"
}
data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/expense/qa/public_subnet_ids"

}
data "aws_ssm_parameter" "db_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/db_subnet_ids"
}



data "aws_ssm_parameter" "backend_subnet_ids" {
  name = "/expense/qa/backend_subnet_ids"
}


data "aws_ami" "joindevops" {

	most_recent      = true
	owners = ["973714476881"]
	
	filter {
		name   = "name"
		values = ["RHEL-9-DevOps-Practice"]
	}
	
	filter {
		name   = "root-device-type"
		values = ["ebs"]
	}

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}
data "aws_ssm_parameter" "backend_sg" {
  name = "/${var.project_name}/${var.environment}/backend-sg"
}
data "aws_ssm_parameter" "frontend_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/public_subnet_ids"
}
data "aws_ssm_parameter" "frontend_sg" {
  name = "/${var.project_name}/${var.environment}/frontend-sg"
}