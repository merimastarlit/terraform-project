
variable vpc_id {
  type        = string

}
variable region {
  type        = string
  default     = "us-east-2"
  description = "variable for region"
}
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
variable user_data {
  type        = string
 
}
variable public_subnet {
  type        = string

}

variable role_profile {
  type        = string
 
}