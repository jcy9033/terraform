provider "aws" {
  region = "us-west-1"
}

resource "aws_db_instance" "example" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "admin"
  password             = "yourpasswordhere"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true

  tags = {
    Name = "example-instance"
  }
}

resource "aws_security_group" "example" {
  name        = "example"
  description = "Example security group for RDS"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["your-ip-address/32"]  # Replace 'your-ip-address' with your IP address
  }
}

resource "aws_db_subnet_group" "example" {
  name       = "example"
  subnet_ids = ["subnet-abcdefgh", "subnet-ijklmnop"]  # Replace with your actual subnet IDs

  tags = {
    Name = "example"
  }
}
