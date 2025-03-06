variable "AMI-ID" {
    description = "AMI ID"
    type = string
    default = "ami-0d682f26195e9ec0f"
  
}
variable "INSTANCE-TYPE" {
        description = "Value of instance type"
        type = string
        default = "t2.micro""
}

variable "KEY-NAME" {
    description = "Key Name"
    type = string
    default = "NewKey""
  
}
