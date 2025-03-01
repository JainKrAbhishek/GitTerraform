#Create VPC
resource "aws_vpc" "Vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "test_server"
    }
}

#Create Subnet

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.Vpc.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "Public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.Vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "Private_subnet"
  }
}


#Create IG and attached to VPC

   resource "aws_internet_gateway" "IG" {
     vpc_id = aws_vpc.Vpc.id
   }

#Create Route table and Edit routes
resource "aws_route_table" "RT" {
    vpc_id = aws_vpc.Vpc.id
    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.IG.id
    }  
}

#Subnet association to route
resource "aws_route_table_association" "public_SA" {
     route_table_id =aws_route_table.RT.id
     subnet_id = aws_subnet.public_subnet.id
}
#Create SG group
   
resource "aws_security_group" "SG" {
  name        = "allow_tls"
  vpc_id      = aws_vpc.Vpc.id
  tags = {
    Name = "dev_sg"
  }
 ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
  }


