#AWS ELB Configuration
resource "aws_elb" "realtechie-elb" {
  name            = "realtechie-elb"
  subnets         = [aws_subnet.realtechiePub-Sub1.id, aws_subnet.realtechiePub-Sub2.id]
  security_groups = [aws_security_group.realtechie-elb-securitygroup.id]
  
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "levelup-elb"
  }
}

