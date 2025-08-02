module "mysql" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${local.resource_name}-mysql"

  instance_type = "t3.micro"
  vpc_security_group_ids = [local.mysql_sg_id]
  subnet_id     = local.public_subnet_id
  ami = data.aws_ami.joindevops.id

  tags = {
    Terraform   = "true"
    Environment = "dev"
    component = "mysql"
    Name = "${local.resource_name}-mysql"

  }
}

module "backend" {
  source = "terraform-aws-modules/ec2-instance/aws"
  name = "${var.environment}-${var.environment}-backend"
  ami = data.aws_ami.joindevops.id
  instance_type = "t3.micro"
  subnet_id = local.backend_subnet_id
  vpc_security_group_ids = [local.backend_sg_id]
   tags = {
    Terraform   = "true"
    Environment = "dev"
    component = "backend"
    Name = "${local.resource_name}-backend"

  }

}
module "frontend" {
    source = "terraform-aws-modules/ec2-instance/aws"
    name = "${var.project_name}-${var.environment}-frontend"
    ami = data.aws_ami.joindevops.id
    instance_type = "t3.micro"
    associate_public_ip_address = true
    subnet_id = local.frontend_subnet_id
    vpc_security_group_ids = [data.aws_ssm_parameter.frontend_sg.value]
    tags = {
    Terraform   = "true"
    Environment = "dev"
    component = "frontend"
    Name = "${local.resource_name}-frontend"

  }

}