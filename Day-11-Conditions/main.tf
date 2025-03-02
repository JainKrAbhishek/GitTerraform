variable "aws_region" {
  description = "The region in which to create the infrastructure"
  type = string
  nullable = false
  default = "ap-south-1"
  validation {
    condition = var.aws_region == "us-east-1" || var.aws_region == "us-west-2"
    error_message = "The variable 'aws_region' must be one of the following regions: us-east-1 ,us-west-2"
  }
} 

resource "aws_s3_bucket" "name" {
    bucket = "thisisgonabenewbucket124"
}