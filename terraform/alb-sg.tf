resource "aws_security_group" "alb-sg" {
  name        = "alb-security-group"
  description = "alb Security Group"
  vpc_id      = aws_vpc.wave-finalproject-1.id

  dynamic ingress {
    for_each = ["80", "443"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
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

  tags = {
    Name = "alb-sg"
  }
}