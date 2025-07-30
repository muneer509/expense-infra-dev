resource "aws_ssm_parameter" "vpc_id" {
  name = "/expense/qa/vpc_id"
    type = "String"
    value = module.vpc.vpc_id
}