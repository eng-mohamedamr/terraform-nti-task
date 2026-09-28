resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "public"
  }
}
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id


  tags = {
    Name = "private"
  }
}
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.main["public-a"].id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.main["private-a"].id
  route_table_id = aws_route_table.private.id
}
