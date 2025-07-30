data "aws_ssm_parameter" "vpc_id" {
  name = "/expense/qa/vpc_id"
  
}