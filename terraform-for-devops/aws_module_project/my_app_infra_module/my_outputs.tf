output "ec2_instances_public_ips" {
  value = aws_instance.my_app_server[*].public_ip
  description = "Public IP addresses of the EC2 instances"
}