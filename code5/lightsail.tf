resource "aws_lightsail_instance" "custom" {
  name              = "dev-server"
  availability_zone = "us-east-1a"
  blueprint_id      = "ubuntu_18_04"
  bundle_id         = "medium_1_0"
  user_data         = <<-EOF
                        #!/bin/bash
                        sudo apt-get update -y
                        sudo apt-get install -y httpd
                        sudo systemctl start httpd
                        sudo systemctl enable httpd
                        echo '<h1>This is deployed by Severin </h1>' | sudo tee /var/www/html/index.html"
                        EOF
}