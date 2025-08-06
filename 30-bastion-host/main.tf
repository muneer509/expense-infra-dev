module "bastion_host" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = local.resource_name

  instance_type = "t3.micro"
  vpc_security_group_ids = [local.bastion_host_sg_id]
  subnet_id     = local.public_subnet_id
  ami = data.aws_ami.joindevops.id
  associate_public_ip_address = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
    component = "bastion_host"
    Name = "bastion_host"

  }
}
