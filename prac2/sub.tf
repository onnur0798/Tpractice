resource "aws_subnet" "pubsub" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.mainvpc.id
  depends_on = [aws_vpc.mainvpc]
  availability_zone = "us-east-1a"
  tags = {
    name ="publicsubnet"
  }
}

resource "aws_subnet" "prvsub" {
  cidr_block = "10.0.2.0/24"
  vpc_id = aws_vpc.mainvpc.id
  depends_on = [aws_vpc.mainvpc]
  availability_zone = "us-east-1b"
  tags = {
    name ="prvsub"
  }
}