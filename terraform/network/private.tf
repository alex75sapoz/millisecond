resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.vpc.subnet.private.cidr
  availability_zone       = var.vpc.availability_zone_id
  map_public_ip_on_launch = false

  tags = {
    Name = "private-${var.constants.environment.id}"
  }
}

resource "aws_default_route_table" "private" {
  default_route_table_id = aws_vpc.main.default_route_table_id

  tags = {
    Name = "private-${var.constants.environment.id}"
  }
}

resource "aws_route_table_association" "private" {
  route_table_id = aws_default_route_table.private.id
  subnet_id      = aws_subnet.private.id
}