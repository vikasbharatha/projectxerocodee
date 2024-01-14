output "instance_public_ip" {
  value = aws_instance.kubemonitor_instance.public_ip
}
