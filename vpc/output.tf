output "vpc_id" {
  value = aws_vpc.project-vpc.id
}

output "public_subnet" {
  value = aws_subnet.public_subnet.id
}

output private_subnet {
  value       = aws_subnet.public_subnet.id
 
}

output "public_subnet2" {
  value = aws_subnet.public_subnet2.id
}