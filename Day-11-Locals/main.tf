locals {
    ami = "ami-0d682f26195e9ec0f"
  instance_type = "t2.micro"
  key_name = "NewKey"
  name = "Locals"
}


resource "aws_instance" "name" {
    ami = local.ami
    instance_type = local.instance_type
    key_name = local.key_name
    tags = {
      Name = local.name
    }
}