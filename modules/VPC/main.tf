resource "aws_vpc" "vpc" {
  count      = var.vpc_enabled ? 1 : 0
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public_a" {
  count             = var.vpc_enabled ? 1 : 0
  vpc_id            = aws_vpc.vpc[0].id
  cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "ap-south-1a"
  tags = {
    Name = "public_subnet_a"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
    "kubernetes.io/role/internal-elb"           = "1"
  }
}

resource "aws_subnet" "public_b" {
  count             = var.vpc_enabled ? 1 : 0
  vpc_id            = aws_vpc.vpc[0].id
  cidr_block        = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "ap-south-1b"
  tags = {
    Name = "public_subnet_b"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
    "kubernetes.io/role/internal-elb"           = "1"
  }
}

resource "aws_internet_gateway" "igw" {
  count  = var.vpc_enabled ? 1 : 0
  vpc_id = aws_vpc.vpc[0].id

  tags = {
    Name = "${var.cluster_name}-igw"
  }
}

resource "aws_route_table" "public_rt" {
  count  = var.vpc_enabled ? 1 : 0
  vpc_id = aws_vpc.vpc[0].id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw[0].id
  }

  tags = {
    Name = "${var.cluster_name}-public-rt"
  }
}

resource "aws_route_table_association" "public_a" {
  count          = var.vpc_enabled ? 1 : 0
  subnet_id      = aws_subnet.public_a[0].id
  route_table_id = aws_route_table.public_rt[0].id
}

resource "aws_route_table_association" "public_b" {
  count          = var.vpc_enabled ? 1 : 0
  subnet_id      = aws_subnet.public_b[0].id
  route_table_id = aws_route_table.public_rt[0].id
}