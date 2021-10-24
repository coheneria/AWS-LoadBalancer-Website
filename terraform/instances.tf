resource "aws_instance" "part1-ansible-controller" {
  ami = "ami-0a8e758f5e873d1c1"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet-1.id
  key_name = "neria"
  tags = {
      Name = "part1-ansible-controller"
  }
}