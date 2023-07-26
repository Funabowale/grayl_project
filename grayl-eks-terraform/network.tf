# VIRTUAL PRIVATE NETWORK
resource "aws_vpc" "graylog" {
  cidr_block = var.vpc_cidr

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name                                           = "${var.project}-vpc"
  }
}
# Public Subnets
resource "aws_subnet" "public" {
  count = var.availability_zones_count

  vpc_id            = aws_vpc.graylog
  cidr_block        = cidrsubnet(var.vpc_cidr, var.subnet_cidr_bits, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name                                           = "${var.project}-public-sg"
  }

  map_public_ip_on_launch = true
}