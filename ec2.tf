resource "aws_instance" "web" {
    for_each = aws_subnet.main
  ami           = "ami-06cfeaaa22092f09d"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.main[each.key].id
  security_groups = [aws_security_group.sg1.name]

  tags = {
    Name = "web ${each.key}"
  }
}