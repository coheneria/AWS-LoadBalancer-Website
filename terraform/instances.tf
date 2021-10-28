# Creating public instance that will contain ansible
resource "aws_instance" "part1-ansible-controller" {
  ami = "ami-0a8e758f5e873d1c1"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet-1.id
  vpc_security_group_ids = ["aws_security_group.controller-security.id"]
  key_name = var.key
  tags = {
      Name = "part1-ansible-controller"
  }

  provisioner "file" {
    source      = var.location
    destination = "home/ubuntu"
  }

  provisioner "file" {
    source      = "../ansible"
    destination = "home/ubuntu"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install ansible",
      "echo '[servers]' > ansible/inventory",
      "echo ${aws_instance.part1-web-server-1.private_ip} >> ansible/inventory",
      "echo ${aws_instance.part1-web-server-2.private_ip} >> ansible/inventory",
      "chmod 600 key.pem"
    ]
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i task.yml"
  }
}


# Creating private instance on subnet-private-1 that will contain docker-web
resource "aws_instance" "part1-web-server-1" {
  ami = "ami-0a8e758f5e873d1c1"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet-2.id
  vpc_security_group_ids = ["aws_security_group.private-security.id"]
  key_name = var.key
  tags = {
      Name = "part1-web-server-1"
  }
}

# Creating private instance on subnet-private-2 that will contain docker-web
resource "aws_instance" "part1-web-server-2" {
  ami = "ami-0a8e758f5e873d1c1"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet-3.id
  vpc_security_group_ids = ["aws_security_group.private-security.id"]
  key_name = var.key
  tags = {
      Name = "part1-web-server-2"
  }
}