output "key_name" {
  value = aws_key_pair.deployer.key_name
}

output "security_groups" {
  value = aws_security_group.project-security-group.id
}