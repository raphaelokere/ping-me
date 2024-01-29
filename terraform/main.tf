provider "aws" {
  region = "us-east-1"
}

resource "aws_lightsail_instance" "app_server" {
  name               = "app-server"
  availability_zone  = "us-east-1a"
  blueprint_id       = "amazon_linux_2"
  bundle_id          = "nano_2_0"
  key_pair_name      = "ping-me"
}

output "public_ip" {
  value = aws_lightsail_instance.app_server.public_ip
}