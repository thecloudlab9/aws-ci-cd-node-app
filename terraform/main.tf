resource "aws_security_group" "web_sg" {
  name_prefix = "web-sg"
  description = "Allow HTTP inbound traffic"

  ingress {
    from_port = 3000
    to_port   = 3000
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app_server" {
  ami                    = "ami-0c2b8ca1dad447f8a" # Ubuntu 20.04
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  user_data              = file("userdata.sh")

  tags = {
    Name = var.app_name
  }
}
