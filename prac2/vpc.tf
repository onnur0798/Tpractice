resource "aws_vpc" "mainvpc" {
  cidr_block = "10.0.0.0/16"

  instance_tenancy = "default"

  tags = {
    Name = "mainvpc"
  }

}

resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.mainvpc.id
  tags = {
    name  ="my igw"
      }
  depends_on = [aws_vpc.mainvpc]
}

resource "aws_eip" "myeip" {
  vpc = true

}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.myeip.id
  subnet_id     = aws_subnet.pubsub

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_vpc.mainvpc,aws_subnet.pubsub]
}