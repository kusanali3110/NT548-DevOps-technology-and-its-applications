output "private_security_group_id" {
  value = aws_security_group.private.id
}

output "public_security_group_id" {
  value = aws_security_group.public.id
}