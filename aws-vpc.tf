
# ---------------- VPC ----------------

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "My-VPC"
  }
}

# ---------------- Private Subnet ----------------

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "Private-Subnet"
  }
}
