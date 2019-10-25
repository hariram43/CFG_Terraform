
variable "vpc_id" {
    
   }
variable "rds_subnet1" {
    
    }
variable "rds_subnet2" {
    
    }
provider "aws" {
    profile =    "cfg-innovation-lab"
    shared_credentials_file = ".ssh/.aws/credentials"
    region = "us-east-1"
}


resource "aws_db_subnet_group" "rds-private-subnet" {
  name       = "rds-private-subnet-group"
  subnet_ids = ["${var.rds_subnet1}","${var.rds_subnet2}"]
}

resource "aws_security_group" "rds-sg" {
  name   = "my-rds-sg3"
  vpc_id = "${var.vpc_id}"
}

# Ingress Security Port 1521
resource "aws_security_group_rule" "oracle_inbound_access" {
  from_port         = 1521
  protocol          = "tcp"
  security_group_id = "${aws_security_group.rds-sg.id}"
  to_port           = 1521
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_db_instance" "default" {
  allocated_storage           = 20
  storage_type                = "gp2"
  engine                      = "oracle-ee"
  engine_version              = "12.1.0.2.v8"
  instance_class              = "db.m4.xlarge"
  name                        = "cfgtest"
  username                    = "admin"
  password                    = "admin123"
  parameter_group_name        = "default.oracle-ee-12.1"
  db_subnet_group_name        = "${aws_db_subnet_group.rds-private-subnet.name}"
  vpc_security_group_ids      = ["${aws_security_group.rds-sg.id}"]
  allow_major_version_upgrade = true
  auto_minor_version_upgrade  = true
  backup_retention_period     = 35
  backup_window               = "22:00-23:00"
  maintenance_window          = "Sat:00:00-Sat:03:00"
  multi_az                    = true
  skip_final_snapshot         = true
  deletion_protection         = false
}
