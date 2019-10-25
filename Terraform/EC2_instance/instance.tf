##variable "key_name" {
 #default = "citizens"
#}

#variable "private_key_path" {
 #default = "/home/ec2-user/terraform-poc/citizens.pem"
#}
variable "subnet_id" {
  
 }
provider "aws" {
    profile =    "cfg-innovation-lab"
    shared_credentials_file = ".ssh/.aws/credentials"
    region = "us-east-1"
}

#resource "aws_key_pair" "deploy" {
 ## key_name   = "Terraform-test"
#  public_key = "ssh-rsa "
#}

resource "aws_instance" "bastion" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  count             = "3"
  key_name   = "c-poc-n.v"
  #vpc_id = "02a8a9fe288d12b42"
  subnet_id = "${var.subnet_id}"

 
  connection {
    host = self.public_ip
    type = "ssh"
    user = "ubuntu"
    #private_key = "${file("${var.private_key_path}")}"

        }
}

#resource "aws_vpc" "default" {
 # cidr_block = "${var.vpc_cidr}"
 # enable_dns_hostnames = true

#}

#resource "aws_security_group" "bastion-sg" {
 # name   = "bastion-security-group"
  #vpc_id = "${aws_vpc.default.id}"

  #ingress {
   # protocol    = "tcp"
 #cidr_blocks = ["0.0.0.0/0"]
  #}
#}
    
