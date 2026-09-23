resource "aws_instance" "web" {
  #checkov:skip=CKV_AWS_88:Public IP is intentionally required because this EC2 instance directly hosts the publicly accessible web server.
  
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true

monitoring = true

metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }


root_block_device {
  encrypted = true
}

  user_data = <<-EOF
    #!/bin/bash

    apt-get update
    apt-get install -y nginx

    cat > /var/www/html/index.html <<'HTML'
    <!doctype html>
    <html>
    <head>
      <title>Terraform Web Server</title>
    </head>
    <body>
      <h1>EI Technologies - Terraform Infrastructure</h1>
      <p>This Ubuntu EC2 server was provisioned with Terraform.</p>
      <p>Infrastructure as Code practical.</p>
    </body>
    </html>
    HTML

    systemctl enable nginx
    systemctl restart nginx
  EOF

  tags = {
    Name = "${var.project_name}-web"
  }
}