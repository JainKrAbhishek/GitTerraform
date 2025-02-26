resource "aws_instance" "name" {
  ami = var.AMI-ID
  instance_type = var.INSTANCE-TYPE
  key_name = var.KEY-NAME
}