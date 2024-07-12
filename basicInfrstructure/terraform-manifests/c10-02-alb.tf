module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "9.9.0"

  load_balancer_type = "application"

  name = "${local.name}-alb"
  vpc_id = module.vpc.vpc_id
  subnets = module.vpc.public_subnets
  security_groups = module.alb_sg.security_group_id

  tags = local.common_tags

  # Listeners
  listeners = {
    http-listener = { 
      port               = "80"
      protocol           = "HTTP"
      forward            = {
        target_group = "mytg1"
        stickiness = {
          enabled = false
        }
      } 
    }
  }

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
    }
  }
}

# Load balancer target group attachment
resource "aws_lb_target_group_attachment" "mytg1" {
  for_each = module.ec2_private_instance
  target_group_arn = module.alb.target_groups["mytg1"].arn
  target_id = each.value.id
  port = 80
}
