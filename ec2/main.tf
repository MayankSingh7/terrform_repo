provider "aws" {
    region = "us-east-1"
    access_key = var.access_key_pair
    secret_key = var.secret_key_value
}

resource "aws_instance" "tf_ec2" {
  ami = var.ami_value
  instance_type = var.instance_type_name
  security_groups = [ aws_security_group.TF_SG.name ]
  tags = {
    name="ec2_tf"
  }
}
resource "aws_security_group" "TF_SG" {
  name        = "security group using Terraform"
  description = "security group using Terraform"

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/16"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/16"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/16"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]    
  }
  tags = {
    Name = "TF_SG"
  }
}
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "tf-bucket-first"
}