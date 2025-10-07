
resource "aws_db_instance" "mydbinstance" {
  allocated_storage    = var.allocated_storage
  db_name              = var.db_name
  engine               = var.engine_type
  engine_version       = var.engine_version
  instance_class       = var.RDS_Instanceclass
  username             = var.DBUsername
  password             = var.DBPassword
  parameter_group_name = var.ParameterGroupName
  skip_final_snapshot  = true
}