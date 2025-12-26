data "aws_ssm_parameter" "amzn2023" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_launch_template" "app" {
  name_prefix   = "app-"
  image_id      = nonsensitive(data.aws_ssm_parameter.amzn2023.value)
  instance_type = "t3.small"
  # user_data = filebase64("${path.module}/example.sh")
}

resource "aws_autoscaling_group" "app" {
  name_prefix      = "app-"
  max_size         = 3
  min_size         = 1
  desired_capacity = 2
  mixed_instances_policy {
    # Reference your clean template here
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.app.id
        version            = "$Latest"
      }
    }

    instances_distribution {
      on_demand_base_capacity                  = 0
      on_demand_percentage_above_base_capacity = 0
      spot_allocation_strategy                 = "price-capacity-optimized"
    }
  }
  vpc_zone_identifier = module.vpc.private_subnets
}
