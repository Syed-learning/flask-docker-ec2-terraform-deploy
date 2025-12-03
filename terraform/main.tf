
provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "flask_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  user_data                   = file("ec2-userdata.sh")

  vpc_security_group_ids = ["sg-01d1cee508cd6dbd7"]  

  tags = {
    Name = "flask-docker-instance"
  }
}

