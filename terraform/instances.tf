resource "aws_instance" "part1-ansible-controller" {
  ami = "ami-0a8e758f5e873d1c1"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet-1.id
  key_name = "neria"
  tags = {
      Name = "part1-ansible-controller"
  }
}

resource "aws_instance" "part1-web-server-1" {
  ami = "ami-0a8e758f5e873d1c1"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet-2.id
  key_name = "neria"
  tags = {
      Name = "part1-web-server-1"
  }
}

resource "aws_instance" "part1-web-server-2" {
  ami = "ami-0a8e758f5e873d1c1"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet-3.id
  key_name = "neria"
  tags = {
      Name = "part1-web-server-2"
  }
}