locals {
  server_names = ["ansible-controller", "Server1"]
}

resource "aws_instance" "ansible_server" {
  count                  = 2
  ami                    = data.aws_ami.ubuntu_image.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private_subnet.id
  key_name               = aws_key_pair.ssh-key.key_name
  vpc_security_group_ids = [aws_security_group.sg_rule.id]

  private_ip = "10.0.1.${10 + count.index}"

  tags = {
    Name = local.server_names[count.index]
  }
}