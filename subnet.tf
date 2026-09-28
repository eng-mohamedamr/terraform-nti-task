resource "aws_subnet" "main" {
  for_each   = var.subnets
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 8, each.value)

  tags = {
    Name = each.key
  }
}
variable "subnets" {
  type = map(number)
  default = {
    public-a  = 1
    public-b  = 2
    private-a = 3
  }
}