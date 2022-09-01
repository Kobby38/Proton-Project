# Configure the AWS Provider
 provider "aws" {
  region = "eu-west-2"
}

#creating networking for project
resource "aws_vpc" "proton-project1" {
  cidr_block       = var.cidr-for-vpc
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "proton-project1"
  }
}

#private subnet
resource "aws_subnet" "proton-priv-sub1" {
  vpc_id     = aws_vpc.proton-project1.id
  cidr_block = var.cidr-for-private-subnet-1
  availability_zone = var.AZ-1
    tags = {
    Name = "proton-priv-sub1"
  }
}

resource "aws_subnet" "proton-priv-sub2" {
  vpc_id     = aws_vpc.proton-project1.id
  cidr_block = var.cidr-for-private-subnet-2
  availability_zone = var.AZ-2
    tags = {
    Name = "proton-priv-sub2"
  }
}

#public subnet
resource "aws_subnet" "proton-pub-sub1" {
  vpc_id     = aws_vpc.proton-project1.id
  cidr_block = var.cidr-for-public-subnet-1
  availability_zone = var.AZ-3
  tags = {
    Name = "proton-pub-sub1"
  }
}

resource "aws_subnet" "proton-pub-sub2" {
  vpc_id     = aws_vpc.proton-project1.id
  cidr_block = var.cidr-for-public-subnet-2
  availability_zone = var.AZ-4
  tags = {
    Name = "proton-pub-sub2"
  }
}

# route table
resource "aws_route_table" "proton-pub-route-table" {
  vpc_id = aws_vpc.proton-project1.id

  tags = {
    Name = "proton-pub-route-table"
  }
}

resource "aws_route_table" "proton-priv-route-table" {
  vpc_id = aws_vpc.proton-project1.id

  tags = {
    Name = "proton-priv-route-table"
  }
}

# route association public
resource "aws_route_table_association" "proton-public-route-table-association-1" {
  subnet_id      = aws_subnet.proton-pub-sub1.id
  route_table_id = aws_route_table.proton-pub-route-table.id
}

resource "aws_route_table_association" "proton-public-route-table-association-2" {
  subnet_id      = aws_subnet.proton-pub-sub2.id
  route_table_id = aws_route_table.proton-pub-route-table.id
}

 # route association private

resource "aws_route_table_association" "proton-private-route-table-association-1" {
  subnet_id      = aws_subnet.proton-priv-sub1.id
  route_table_id = aws_route_table.proton-priv-route-table.id  
   }

  resource "aws_route_table_association" "proton-private-route-table-association-2" {
  subnet_id      = aws_subnet.proton-priv-sub2.id
  route_table_id = aws_route_table.proton-priv-route-table.id
}

# internet gateway

resource "aws_internet_gateway" "Proton-igw" {
  vpc_id = aws_vpc.proton-project1.id

  tags = {
    Name = "Proton-igw"
  }
}

# aws route
resource "aws_route" "Proton-igw-association" {
  route_table_id            = aws_route_table.proton-pub-route-table.id
  gateway_id                = aws_internet_gateway.Proton-igw.id  
  destination_cidr_block    = var.internet-gateway-association
  }
