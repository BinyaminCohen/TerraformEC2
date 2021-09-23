provider "aws" {
  region = "us-east-2"
  access_key = "AKIAVHPCKY7XQKWLWPFU"
  secret_key = "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"
}

resource "aws_instance" "terraform_ec2" {
  ami = "ami-062f78fda82ba540f"
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform-EC2"
  }
}