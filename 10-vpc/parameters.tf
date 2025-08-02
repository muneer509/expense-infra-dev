resource "aws_ssm_parameter" "vpc_id" {
  name = "/expense/qa/vpc_id"
    type = "String"
    value = module.vpc.vpc_id
}
resource "aws_ssm_parameter" "public_subnet_ids" {
  name = "/expense/qa/public_subnet_ids"
  type = "StringList"
  value = join(",", module.vpc.public_subnet_ids[*])
}
resource "aws_ssm_parameter" "backend_subnet_ids" {
  name = "/expense/qa/backend_subnet_ids"
  type = "StringList"
  value = join(",", module.vpc.private_subnet_ids[*])
}
resource "aws_ssm_parameter" "db_subnet_ids" {
  type = "StringList"
  name = "/expense/qa/db_subnet_ids"
  value = join(",", module.vpc.database_subnet_ids[*])
}