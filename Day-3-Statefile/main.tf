resource "aws_instance" "name" {
  ami = var.ami-id
  instance_type = var.Instance
  key_name = var.key_name
  tags = {
    Name= "dev"
  }
}