
terraform {
  cloud {
    organization = "meerim_omurbek"

    workspaces {
      name = "Terraform-project"
    }
  }
}

module vpc {
    source = "./vpc"
}

module role {
 source = "./role"
}

module ec2 {
  source = "./ec2"
  vpc_id = module.vpc.vpc_id
  public_subnet = module.vpc.public_subnet
  role_profile = module.role.role_profile
  user_data = file("./web-script.sh")
}

module template {
  source = "./template"
  key_name = module.ec2.key_name
  private_subnet = module.vpc.private_subnet
  security_groups = module.ec2.security_groups
  user_data = filebase64("./web-script.sh")
}

module asg {
  source = "./asg"
  project_launch_template = module.template.project_launch_template
}


 module alb {
  source = "./alb"
  project-vpc = module.vpc.vpc_id
  project-asg  = module.asg.project-asg
  public_subnet = module.vpc.public_subnet
  public_subnet2 = module.vpc.public_subnet2
  security_groups = module.ec2.security_groups
 }

