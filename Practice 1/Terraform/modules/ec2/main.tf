resource "aws_key_pair" "key_pair" {
  key_name = var.key_name
  public_key = var.public_key
}

resource "aws_instance" "public" {
  count         = length(var.public_subnet_ids)
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_ids[count.index]
  vpc_security_group_ids = [var.public_security_group_id]

  key_name = aws_key_pair.key_pair.key_name

  tags = {
    Name = "public-instance-${count.index}"
  }
}

resource "aws_instance" "private" {
  count         = length(var.private_subnet_ids)
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_ids[count.index]
  vpc_security_group_ids = [var.private_security_group_id]

  key_name = aws_key_pair.key_pair.key_name

  tags = {
    Name = "private-instance-${count.index}"
  }
}