terraform {
  backend "s3" {
    bucket = "statefilestoragebucket"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
