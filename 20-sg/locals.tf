locals {
  sg_name = "expense-qa-sg"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
}