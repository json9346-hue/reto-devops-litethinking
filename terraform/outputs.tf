output "ec2_public_ip" {
  description = "Public IP of EC2"
  value       = aws_instance.servidor.public_ip
}

output "grafana_url" {
  value = "http://${aws_instance.servidor.public_ip}:3000"
}

output "prometheus_url" {
  value = "http://${aws_instance.servidor.public_ip}:9090"
}

output "rds_endpoint" {
  value = aws_db_instance.mysql.endpoint
}