resource "aws_instance" "dev" {
    ami = "ami-0d682f26195e9ec0f"
    instance_type = "t2.micro"
    key_name = "NewKey"
}

resource "aws_s3_bucket" "bucketdev" {
    bucket = "awskibucketbnrhih"
}
