variable insType {
  type        = string
  default     = "t2.micro"
  description = "instance type"
}
variable insAMI {
  type        = string
  default     = "ami-09694bfab577e90b0"
  description = "instance ami"
}
variable key_name {
  type        = string
 
}

variable user_data {
  type        = string
 
}
variable private_subnet {
  type        = string

}

variable security_groups {
  type        = string
 
}