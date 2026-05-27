resource "aws_security_group" "sg_rule" {
  name        = "sg_rule"
  description = "allow inbound & outbound network traffic"

  vpc_id = aws_vpc.main.id

  dynamic "ingress" {
    for_each = [22, 443, 3389, 80]
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}