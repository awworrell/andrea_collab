provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
    cidr_block = "${var.vpc_cidr}"

    tags {
        Name = "main"
        Created = "terraform"        
    }
}

resource "aws_subnet" "main_public_a" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "${var.subnet_a_cidr}"
  availability_zone = "us-east-1a"

  tags{
      Name = "main public subnet"
      Created = "terraform"
  }
}

resource "aws_subnet" "main_public_b" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "192.168.3.0/24"
  availability_zone = "us-east-1b"

  tags{
      Name = "main public subnet"
      Created = "terraform"
  }
}
resource "aws_subnet" "main_private_a" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "192.168.4.0/24"
  availability_zone = "us-east-1a"

  tags{
      Name = "main public subnet"
      Created = "terraform"
  }
}
resource "aws_subnet" "main_private_b" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "192.168.5.0/24"
  availability_zone = "us-east-1a"

  tags{
      Name = "main public subnet"
      Created = "terraform"
  }
}

resource "aws_route53_zone" "main_zone" {
  name = "mytestapp.com"
}
