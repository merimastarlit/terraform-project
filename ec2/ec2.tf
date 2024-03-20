resource "aws_security_group" "project-security-group" {
description = "security group for my web ec2 instance"
 vpc_id      = var.vpc_id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # -1 special value indicating that all protocols are allowed.
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "project-PubEC2" {
  ami                         = var.insAMI
  instance_type               = var.insType
  key_name                    = aws_key_pair.deployer.key_name
  subnet_id      = var.public_subnet
  security_groups     = [aws_security_group.project-security-group.id]
  availability_zone           = "${var.region}a"
 
 
  associate_public_ip_address = true
  iam_instance_profile = var.role_profile
  user_data                   = var.user_data
  

  tags = {
    Name = "my-web-ec2"
  }
}