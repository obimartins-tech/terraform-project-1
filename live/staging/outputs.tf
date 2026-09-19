output "vpc_id" {
  description = "ID of the development VPC"
  value       = module.network.vpc_id
}

output "public_subnet_id" {
  description = "ID of the development public subnet"
  value       = module.network.public_subnet_id
}

output "instance_id" {
  description = "ID of the development EC2 instance"
  value       = module.web_server.instance_id
}

output "public_ip" {
  description = "Public IP of the development web server"
  value       = module.web_server.public_ip
}

output "website_url" {
  description = "URL of the development web server"
  value       = "http://${module.web_server.public_ip}"
}