module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "9.9.0"

  load_balancer_type = "application"

  name            = "${local.name}-alb"
  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.public_subnets
  security_groups = [module.alb_sg.security_group_id]

  enable_deletion_protection = false  
  tags = local.common_tags



 

  # Target groups
  target_groups = {
    mytg1 = {
      create_attachment = false
      name_prefix = "mytg1-"
      protocol = "HTTP"
      port = 80
      target_type = "instance"
      deregistration_delay = 10
      load_balancing_cross_zone_enabled = false
      protocol_version = "HTTP1"
      health_check = {
        enabled = true
        interval = 30
        path = "/app1/index.html"
        port = "traffic-port"
        protocol = "HTTP"
        timeout = 5
        healthy_threshold = 3
        unhealthy_threshold = 3
        matcher = "200"
      }
    },
    mytg2 = {
      create_attachment = false
      name_prefix = "mytg2-"
      protocol = "HTTP"
      port = 80
      target_type = "instance"
      deregistration_delay = 10
      load_balancing_cross_zone_enabled = false
      protocol_version = "HTTP1"
      health_check = {
        enabled = true
        interval = 30
        path = "/app2/index.html"
        port = "traffic-port"
        protocol = "HTTP"
        timeout = 5
        healthy_threshold = 3
        unhealthy_threshold = 3
        matcher = "200"
      }
    }
  }
}

# Load balancer target groups attachments
resource "aws_lb_target_group_attachment" "mytg1" {
  for_each = module.ec2_private_instance_app1
  target_group_arn = module.alb.target_groups["mytg1"].arn
  target_id = each.value.id
  port = 80
}

resource "aws_lb_target_group_attachment" "mytg2" {
  for_each = module.ec2_private_instance_app2
  target_group_arn = module.alb.target_groups["mytg2"].arn
  target_id = each.value.id
  port = 80
}


# ALB Rules
resource "aws_lb_listener_rule" "app1_rule" {
  listener_arn = aws_lb_listener.https_listener.arn
  priority     = 1

  action {
    type             = "forward"
    target_group_arn = module.alb.target_groups["mytg1"].arn
  }

  condition {
    path_pattern {
      values = ["/app1*"]
    }
  }
}

resource "aws_lb_listener_rule" "app2_rule" {
  listener_arn = aws_lb_listener.https_listener.arn
  priority     = 2

  action {
    type             = "forward"
    target_group_arn = module.alb.target_groups["mytg2"].arn
  }

  condition {
    path_pattern {
      values = ["/app2*"]
    }
  }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = module.alb.arn
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

resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = module.alb.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = module.acm.acm_certificate_arn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}