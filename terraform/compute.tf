resource "aws_instance" "atlas_server" {
  ami                    = "ami-0c02fb55956c7d316"
  instance_type          = "t3.micro"
  key_name               = "atlas-key"
  subnet_id              = aws_subnet.atlas_public_subnet.id
  vpc_security_group_ids = [aws_security_group.atlas_sg.id]

  tags = {
    Name = "AtlasServer"
  }
}
