resource "aws_security_group" "public" {
  name        = "public-security-group"
  description = "Allow SSH from specific IP"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public-security-group"
  }
}

resource "aws_security_group" "private" {
  name        = "private-security-group"
  description = "Allow SSH from Public instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.from_port_demand
    to_port     = var.to_port_demand
    protocol    = "tcp"
    security_groups = [aws_security_group.public.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private-security-group"
  }
}
