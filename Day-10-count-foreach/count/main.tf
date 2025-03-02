# resource "aws_instance" "dev" {
#   ami           = "ami-0d682f26195e9ec0f"
#   instance_type = "t2.micro"
#   key_name      = "NewKey"
#   count         = 2
#   #   tags = {
#   #     Name ="test"
#   #   }

#   tags = {
#     Name = "test-${count.index}"
#   }
# }

# with variables

variable "ami" {
    type = string
    default = "ami-0d682f26195e9ec0f"
}

variable "instance_type" {
    type = string
    default = "t2.micro"  
}

variable "key_name" {
    type = string
    default = "NewKey"
  
}

variable "name" {
    type = list(string)
    default = [ "Test" ]
}

resource "aws_instance" "testing" {
 ami = var.ami
 instance_type = var.instance_type
 key_name = var.key_name
 count = length(var.name)

 tags = {
   Name = var.name[count.index]
 }
}