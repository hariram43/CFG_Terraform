provider "aws" {
    profile =    "cfg-innovation-lab"
    shared_credentials_file = "jobs/.aws/credentials"
    region = "us-east-1"
}


# Define our VPC
resource "aws_vpc" "default" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags = {
    Name = "C-POC"
  }

}

# Define the public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "us-east-1a"

 tags = {
   Name = "Public_Subnet1_AZ-1"
 }
}

# Define the private subnet
#resource "aws_subnet" "public_subnet_2" {
#  vpc_id = "${aws_vpc.default.id}"
#  cidr_block = "${var.public_subnet_2_cidr}"
 # availability_zone = "us-east-2b"

#  tags = {
#    Name = "Public_Subnet1_AZ-2"
 # }
#}


# Define the public subnet 3
#resource "aws_subnet" "public_subnet_3" {
#  vpc_id = "${aws_vpc.default.id}"
 # cidr_block = "${var.public_subnet_cidr}"
 # availability_zone = "us-east-2c"

#  tags = {
 #   Name = "Public_Subnet1_AZ-3"
#  }
#}

# Define the Private subnet 4
# "aws_subnet" "private_subnet_4" {
#  vpc_id = "${aws_vpc.default.id}"
#cidr_block = "${var.private_subnet_cidr}"
 # availability_zone = "us-east-2a"

  #tags = {
   # Name = "Private_Subnet4_AZ-1"
 # }
#}

# Define the Private subnet 5
#resource "aws_subnet" "private_subnet_5" {
#  vpc_id = "${aws_vpc.default.id}"
##  cidr_block = "${var.private_subnet_cidr}"
#  availability_zone = "us-east-2b"

 # tags = {
 #   Name = "Private_Subnet5_AZ-2"
 # }
#}

# Define the Private subnet 6
#resource "aws_subnet" "private_subnet_6" {
#  vpc_id = "${aws_vpc.default.id}"
 # cidr_block = "${var.private_subnet_cidr}"
 # availability_zone = "us-east-2c"

 # tags = {
 #   Name = "Private_Subnet6_AZ-3"
 # }
#}

# Define the Private subnet for Db 1
#resource "aws_subnet" "private_subnet_7" {
#  vpc_id = "${aws_vpc.default.id}"
 # cidr_block = "${var.private_subnet_cidr}"
#  availability_zone = "us-east-2a"

 # tags = {
  #  Name = "Private_Subnet7_AZ-1-DB"
 # }
#}

# Define the Private subnet for DB 2
#resource "aws_subnet" "private_subnet_8" {
#  vpc_id = "${aws_vpc.default.id}"
#  cidr_block = "${var.private_subnet_cidr}"
 # availability_zone = "us-east-2b"

#  tags = {
 #   Name = "Private_Subnet8_AZ-2-DB"
#  }
#}

# Define the Private subnet for DB 3
#resource "aws_subnet" "private_subnet_9" {
 ## vpc_id = "${aws_vpc.default.id}"
  #cidr_block = "${var.private_subnet_cidr}"
  #availability_zone = "us-east-2c"

 # tags = {
   # Name = "Private_Subnet9_AZ-3-DB"
 # }
#}

# Define the Private subnet for ES 1
#resource "aws_subnet" "private_subnet_10" {
#  vpc_id = "${aws_vpc.default.id}"
 ## cidr_block = "${var.private_subnet_cidr}"
 # availability_zone = "us-east-2a"

#  tags = {
 #  Name = "Private_Subnet10_AZ-1-DB"
 # }
#}

# Define the Private subnet for ES 2
#resource "aws_subnet" "private_subnet_11" {
 # vpc_id = "${aws_vpc.default.id}"
  #cidr_block = "${var.private_subnet_cidr}"
  #availability_zone = "us-east-2b"

 # tags = {
 #   Name = "Private_Subnet11_AZ-2-DB"
 # }
#}

# Define the Private subnet for ES 3
##resource "aws_subnet" "private_subnet_12" {
 ## vpc_id = "${aws_vpc.default.id}"
 # cidr_block = "${var.private_subnet_cidr}"
  #availability_zone = "us-east-2c"

  #tags = {
  #  Name = "Private_Subnet12_AZ-3-DB"
#}
#} 
