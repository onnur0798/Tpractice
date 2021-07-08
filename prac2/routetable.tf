resource "aws_route_table" "pub1a" {
  vpc_id = aws_vpc.mainvpc.id
  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.myigw.id
  }
  tags = {
    Name = "pub1s"
  }
  depends_on = [aws_vpc.mainvpc,aws_subnet.pubsub]
}

resource "aws_route_table" "prv1b" {
  vpc_id = aws_vpc.mainvpc.id
  route {
    cidr_block = "10.0.2.0/24"
    gateway_id = aws_nat_gateway.example.id
  }
  tags = {
    Name = "pub1s"
  }
  depends_on = [aws_vpc.mainvpc,aws_subnet.prvsub]
}
resource "aws_route_table_association" "public1a" {
  subnet_id      = aws_subnet.pubsub.id
  route_table_id = aws_route_table.pub1a.id

  depends_on = [aws_vpc.mainvpc,aws_subnet.pubsub]
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.prvsub.id
  route_table_id = aws_route_table.prv1b.id

  depends_on = [aws_vpc.mainvpc,aws_subnet.pubsub]
}