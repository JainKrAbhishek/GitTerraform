resource "aws_instance" "name" {
  ami = "ami-0d682f26195e9ec0f"
  instance_type = "t2.micro"
  key_name = "NewKey"
  availability_zone = "ap-south-1b"
  
#   lifecycle {
#     create_before_destroy = true  #Create First Then Delete
#   }
#   lifecycle {
#     ignore_changes = [ tags ]
#   }
#   lifecycle {
#     prevent_destroy = true
#   }
  }
