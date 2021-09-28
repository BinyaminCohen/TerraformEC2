provider "aws" {
  region = "us-east-2"
  access_key = "AKIAVHPCKY7XQKWLWPFU"
  secret_key = "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"
}

resource "aws_instance" "terraform_ec2" {
  ami = "ami-00dfe2c7ce89a450b"
  instance_type = "t2.micro"
  key_name = "newKey"
  user_data = file("./TfScript.sh")
  security_groups = [aws_security_group.TF_ec2_SG.name]
  tags = {
    Name = "Terraform-EC2"
  }
  depends_on = [aws_security_group.TF_ec2_SG]
}

resource "aws_security_group" "TF_ec2_SG" {
  name        = "Flask-Traffic-Allow"
  description = "Allow Web traffic to flask server"

  ingress = [
    {
      description      = "flask_web_server_ports_protocol"
      from_port        = 5000
      to_port          = 5000
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
    },
    {
      description      = "flask_web_server_ports_protocol"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
    }
  ]

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]

  }

  tags = {
    Name = "allow_flask_traffic"
  }
}



