resource "aws_launch_template" "project_launch_template" {
 
  description    = "Example Launch Template"
  
  image_id = var.insAMI
   
  instance_type = var.insType

  key_name = var.key_name

  

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 8
    }
  }

  network_interfaces {
    associate_public_ip_address = true
    subnet_id      = var.private_subnet
    security_groups     = [var.security_groups]
  }
   

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "ExampleInstance"
    }
  }
  user_data = var.user_data
}