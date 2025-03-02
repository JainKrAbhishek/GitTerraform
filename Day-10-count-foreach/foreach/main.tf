
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
    default = ["dev","prod"]
}

resource "aws_instance" "testing" {
 ami = var.ami
 instance_type = var.instance_type
 key_name = var.key_name
 #count = length(var.name)
for_each = toset(var.name)
 tags = {
   Name = each.value
 }
}