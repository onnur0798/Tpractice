resource "aws_instance" "myfirst" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"

  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    name ="myfirst"
  }
}