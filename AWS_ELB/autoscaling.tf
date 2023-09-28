#AutoScaling Launch Configuration
resource "aws_launch_configuration" "levelup-launchconfig" {
  name_prefix     = "realtechie-launchconfig"
  image_id        = lookup(var.AMIS, var.AWS_REGION)
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.realtechie_key.key_name
  security_groups = [aws_security_group.realtechie-sg.id]
  user_data       = "#!/bin/bash\napt-get update\napt-get -y install net-tools nginx\nMYIP=`ifconfig | grep -E '(inet 10)|(addr:10)' | awk '{ print $2 }' | cut -d ':' -f2`\necho 'Hello Team\nThis is my IP: '$MYIP > /var/www/html/index.html"

  lifecycle {
    create_before_destroy = true
  }
}

#Generate Key
resource "aws_key_pair" "realtechie_key" {
    key_name = "realtechie_key"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}
#Autoscaling Group
resource "aws_autoscaling_group" "realtechie-autoscaling" {
  name                      = "realtechie-autoscaling"
  vpc_zone_identifier       = [aws_subnet.realtechiePri-Sub1.id, aws_subnet.realtechiePri-Sub2.id]
  launch_configuration      = aws_launch_configuration.realtechie-launchconfig.name
  min_size                  = 2
  max_size                  = 5
  health_check_grace_period = 200
  health_check_type         = "ELB"
  load_balancers            = [aws_elb.realtechie-elb.name]
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "realtechie Custom EC2 instance via LB"
    propagate_at_launch = true
  }
}

output "ELB" {
  value = aws_elb.realtechie-elb.dns_name
}