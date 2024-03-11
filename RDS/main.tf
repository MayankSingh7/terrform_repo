provider "aws" {
    region = "us-east-1"
}

resource "aws_db_instance" "TF_RDS" {
  allocated_storage    = 1
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = " "
  instance_class       = " "
  username             = var.username_value
  password             = var.password_value
  parameter_group_name = " "
  skip_final_snapshot  = true
}