resource "aws_instance" "Day-2" {
  ami           = var.ami-id
  instance_type = var.instance_type
  key_name      = var.key_name
}