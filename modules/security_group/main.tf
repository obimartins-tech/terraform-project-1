resource "aws_security_group" "web" {
  #checkov:skip=CKV2_AWS_5:Security group is intentionally attached to the EC2 web server through the web_server module.

  #checkov:skip=CKV_AWS_260:Public HTTP access is intentionally required because this EC2 instance hosts a publicly accessible web server.
  
  #checkov:skip=CKV_AWS_382:Unrestricted outbound access is intentionally required for this web server to retrieve updates, packages, dependencies, and external resources.
 

  name        = "${var.project_name}-web-sg"
  description = "Allow HTTP traffic to web server"
  vpc_id      = var.vpc_id


  ingress {
    description = "HTTP from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-web-sg"
  }
}