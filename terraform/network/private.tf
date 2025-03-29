resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.vpc.subnet.private.cidr
  availability_zone = var.vpc.availability_zone_id

  tags = {
    Name = "private-${var.constants.environment.id}"
  }
}

resource "aws_eip" "main" {
  domain = "vpc"
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.main.id
  subnet_id     = aws_subnet.private.id

  tags = {
    Name = "main-${var.constants.environment.id}"
  }

  depends_on = [aws_internet_gateway.main]
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    nat_gateway_id = aws_nat_gateway.main.id
    cidr_block     = "0.0.0.0/0"
  }

  tags = {
    Name = "private-${var.constants.environment.id}"
  }
}

resource "aws_route_table_association" "private" {
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.private.id
}