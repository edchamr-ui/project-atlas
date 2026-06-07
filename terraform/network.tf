resource "aws_vpc" "atlas_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "AtlasVPC"
  }
}

resource "aws_subnet" "atlas_public_subnet" {
  vpc_id                  = aws_vpc.atlas_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "AtlasPublicSubnet"
  }
}

resource "aws_internet_gateway" "atlas_igw" {
  vpc_id = aws_vpc.atlas_vpc.id

  tags = {
    Name = "AtlasInternetGateway"
  }
}

resource "aws_route_table" "atlas_public_rt" {
  vpc_id = aws_vpc.atlas_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.atlas_igw.id
  }

  tags = {
    Name = "AtlasPublicRouteTable"
  }
}

resource "aws_route_table_association" "atlas_public_assoc" {
  subnet_id      = aws_subnet.atlas_public_subnet.id
  route_table_id = aws_route_table.atlas_public_rt.id
}
