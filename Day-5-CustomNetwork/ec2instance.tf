#Create Servers



resource "aws_instance" "Instance" {

    ami =  "ami-0d682f26195e9ec0f"
    instance_type = "t2.micro"
    key_name = "NewKey"
    subnet_id = aws_subnet.public_subnet.id
    vpc_security_group_ids = [aws_security_group.SG.id]
    associate_public_ip_address = true
    tags ={
        Name= "TF"
    }
}