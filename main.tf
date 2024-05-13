provider "aws" {
  region = "eu-west-2" # London region
}
resource "aws_s3_bucket" "devsecops-terraform-main" {
  bucket = "devsecops-terraform-main"
}

resource "aws_instance" "test5" {
  ami           = "ami-0903ff18cc3c8e341" 
  instance_type = "t2.micro"  
  tags = {
    Name = "devsecops-terraform-main"
}
}
terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "devsecops-terraform-main"
    key            = "global/s3/terraform.tfstate"
    region         = "eu-west-2"
  }
}