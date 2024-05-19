provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# VPC setup
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "subnet_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidrs[0]
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zones[0]
}

resource "aws_subnet" "subnet_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidrs[1]
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zones[1]
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "internet_gateway"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
}

resource "aws_route_table_association" "subnet_a_route" {
  subnet_id      = aws_subnet.subnet_a.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "subnet_b_route" {
  subnet_id      = aws_subnet.subnet_b.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_security_group" "security_group" {
  name   = "ecs-security-group"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ECR repositories
resource "aws_ecr_repository" "repositories" {
  for_each = toset(var.ecr_repositories)
  name     = each.key

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = each.key
  }
}
