module "share" {
  source = "../shared"
}
module "network" {
  source = "../network"
}
#create load balancer
resource "aws_lb" "samplealb" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.network.publicsg_id]
  subnets            = [module.share.publicsubnet1a,module.share.publicsubnet1b]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}
# create target group
resource "aws_lb_target_group" "sample_targetgroup" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.share.vpcid
}
# create listenner
resource "aws_lb_listener" "mylistener" {
  load_balancer_arn = aws_lb.samplealb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.sample_targetgroup.arn
  }
}


