# variable 

variable "key_name" {
 default = "c-poc"
}

variable "private_key_path" {
 default = "/home/ec2-user/terraform-poc/citizens.pem"
 }

variable "ami" {
  default = "ami-0080e4c5bc078760e"
 }
provider "aws" {
  access_key = "AKIA6B5SRNQNMATA6X66"
  secret_key = "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"
  region     = "us-east-1"
}

resource "aws_vpc" "mainvpc" {
  cidr_block = "172.31.0.0/20"
}

resource "aws_default_security_group" "default" {
  vpc_id = "${aws_vpc.mainvpc.id}"

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_instance" "Terraform" {
  ami           = "ami-0b69ea66ff7391e80"
  instance_type = "t2.micro"
  key_name   = "${var.key_name}"
 
  connection {
    host = self.public_ip
    type = "ssh"
    user = "ec2-user"
    private_key = "${file("${var.private_key_path}")}"
   }

 
}
