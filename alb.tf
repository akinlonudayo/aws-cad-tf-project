
resource "aws_lb" "applicationLB" {
  name               = var.applicationLB
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.PublicALBSG.id]
  subnets            = [aws_subnet.subnet1.id, aws_subnet.subnet3.id]

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "applicationTG" {
  name        = var.applicationTG
  target_type = "instance"
  port        = 80
  protocol    = "TCP"
  vpc_id      = aws_vpc.customVPC.id
}

resource "aws_lb_target_group_attachment" "appTGAttachment" {
  target_group_arn = aws_lb_target_group.applicationTG.arn
  target_id        = aws_instance.EC2Instance.id
  port             = 80
}


resource "aws_lb_listener" "appListener" {
  load_balancer_arn = aws_lb.applicationLB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}
