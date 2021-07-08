resource "aws_instance" "myfirst" {
  ami = "${var.ami}"
    instance_type = "${var.instance_type}"
  tags = {
    name ="myfirst"
  }

  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]

}