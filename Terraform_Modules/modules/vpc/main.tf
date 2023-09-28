#Create AWS VPC
resource "aws_vpc" "realtechie" {
  cidr_block                    = var.vpc_cidr
  instance_tenancy              = "default"
  enable_dns_support            = "true"
  enable_dns_hostnames          = "true"
  #enable_classiclink           = "false"

  tags = {
    Name =                      "${var.project_name}-vpc"
  }
}

# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}

# Public Subnets in Custom VPC
resource "aws_subnet" "realtechiePub-Sub1" {
  vpc_id                        = var.vpc_cidr
  cidr_block                    = var.realtechiePub-Sub1_cidr
  map_public_ip_on_launch       = "true"
  availability_zone             = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch       = true

  tags = {
    Name                        = "realtechiePub-Sub1"
  }
}

resource "aws_subnet" "realtechiePub-Sub2" {
  vpc_id                        = var.vpc_cidr
  cidr_block                    = var.realtechiePub-Sub2_cidr
  map_public_ip_on_launch       = "true"
  availability_zone             = data.aws_availability_zones.available_zones.names[1]

  tags = {
    Name = "realtechiePub-Sub2"
  }
}

resource "aws_subnet" "realtechiePub-Sub3" {
  vpc_id                         = var.vpc_cidr
  cidr_block                     = var.realtechiePub-Sub2_cidr
  map_public_ip_on_launch        = "true"
  availability_zone              = data.aws_availability_zones.available_zones.names[2]

  tags = {
    Name = "realtechiePub-Sub3"
  }
}

# Private Subnets in Custom VPC
resource "aws_subnet" "realtechiePri-Sub1" {
  vpc_id                        = var.vpc_cidr
  cidr_block                    = var.realtechiePri-Sub1_cidr
  map_public_ip_on_launch       = "false"
  availability_zone             = data.aws_availability_zones.available_zones.names[0]

  tags = {
    Name = "realtechiPri-Sub1"
  }
}

resource "aws_subnet" "realtechiePri-Sub2" {
  vpc_id                        = var.vpc_cidr
  cidr_block                    = var.realtechiePri-Sub2_cidr
  map_public_ip_on_launch       = "false"
  availability_zone             = data.aws_availability_zones.available_zones.names[2]

  tags = {
    Name = "realtechiePri-Sub2"
  }
}

resource "aws_subnet" "realtechiePri-Sub3" {
  vpc_id                        = var.vpc_cidr
  cidr_block                    = var.realtechiePri-Sub3_cidr
  map_public_ip_on_launch       = "false"
  availability_zone             = data.aws_availability_zones.available_zones.names[2]

  tags = {
    Name = "realtechiePri-Sub3"
  }
}

# Custom internet Gateway
resource "aws_internet_gateway" "realtechie-igw" {
  vpc_id                        = var.vpc_cidr

  tags = {
    Name                        = "${var.project_name}-igw"
  }
}


# create route table and add public route
resource "aws_route_table" "public_route_table" {
  vpc_id       = var.vpc_cidr

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.realtechie-igw.id  
  }

  tags       = {
    Name     = "public_route_table"
  }
}

# associate public subnet az1 to "public route table"
resource "aws_route_table_association" "public_subnet_az1_route_table_association" {
  subnet_id           = aws_subnet.realtechiePub-Sub1.id
  route_table_id      = aws_route_table.public_route_table.id
}

# associate public subnet az2 to "public route table"
resource "aws_route_table_association" "public_subnet_az2_route_table_association" {
  subnet_id           = aws_subnet.realtechiePub-Sub2.id
  route_table_id      = aws_route_table.public_route_table.id
}

# associate public subnet az2 to "public route table"
resource "aws_route_table_association" "public_subnet_az2_route_table_association" {
  subnet_id           = aws_subnet.realtechiePub-Sub3.id
  route_table_id      = aws_route_table.public_route_table.id
}


