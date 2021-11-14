resource "aws_lb_target_group" "wave-target-group" {
  health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  name        = "wave-target-group"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.wave-finalproject-1.id
  depends_on = [
    aws_instance.part1-ansible-controller,
  ]
}

resource "aws_lb_target_group_attachment" "wave-instance-01" {
  target_group_arn = aws_lb_target_group.wave-target-group.arn
  target_id        = "${aws_instance.part1-web-server-1.id}"
  port= 80
}

resource "aws_lb_target_group_attachment" "wave-instance-02" {
  target_group_arn = aws_lb_target_group.wave-target-group.arn
  target_id        = "${aws_instance.part1-web-server-2.id}"
  port= 80
}
resource "aws_lb" "wave-aws-alb" {
  name     = "wave-aws-alb"
  internal = false

  security_groups = [
    "${aws_security_group.alb-sg.id}",
  ]

  subnets = [
    "${aws_subnet.subnet-2.id}",
    "${aws_subnet.subnet-3.id}",
  ]

  tags = {
    Name = "wave-aws-alb"
  }

  ip_address_type    = "ipv4"
  load_balancer_type = "application"
}

resource "aws_lb_listener" "my-test-alb-listner" {
  load_balancer_arn = "${aws_lb.wave-aws-alb.arn}"
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.wave-target-group.arn}"
  }
}