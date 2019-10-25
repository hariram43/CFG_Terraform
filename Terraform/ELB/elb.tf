variable "rds_subnet1" {
    
    }

variable "rds_subnet2" {

}
provider "aws" {
    profile =    "cfg-innovation-lab"
    shared_credentials_file = ".ssh/.aws/credentials"
   region = "us-east-1"
}

#variable "region" {
##  description = "AWS region for hosting our your network"
  #default = "us-east-1"
#}

data "aws_availability_zones" "all" {}


resource "aws_security_group" "elb" {
  name = "terraform-example-elb"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elb" "example" {
  name = "terraform-asg-example"
  security_groups = ["${aws_security_group.elb.id}"]
  load_balancer_type = "network"
  #availability_zones = ["${data.aws_availability_zones.all.names}"]
     subnets = ["${var.rds_subnet1}","${var.rds_subnet2}"]
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    interval = 30
    target = "HTTP:8080/"
  }
  listener {
    lb_port = 80
    lb_protocol = "http"
    instance_port = "8080"
    instance_protocol = "http"
  }
} 


