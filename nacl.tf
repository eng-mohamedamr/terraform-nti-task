resource "aws_network_acl" "public" {
  vpc_id = aws_vpc.main.id

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  tags = {
    Name = "main-NACL"
  }
}
resource "aws_network_acl_association" "example" {
  network_acl_id = aws_network_acl.public.id
  subnet_id      = aws_subnet.main["public-a"].id
}
resource "aws_network_acl_association" "example2" {
  network_acl_id = aws_network_acl.public.id
  subnet_id      = aws_subnet.main["private-a"].id
}