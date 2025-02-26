output "private_ip" {
  value = aws_instance.Day-2.private_ip

}
output "Public_ip" {
  value     = aws_instance.Day-2.public_ip
  sensitive = true
}

output "name" {
  value = aws_instance.Day-2.availability_zone

}