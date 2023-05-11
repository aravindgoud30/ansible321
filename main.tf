provider "aws" {
  region       = "ap-south-1"
}

resource "aws_instance" "sampleinstance" {
  ami                     = "ami-0dcc1e21636832c5d"
  instance_type           = "t2.micro"
  vpc_security_group_ids  =  [aws_security_group.samplegroup.id]

  tags = {
    Name = "sampleinstance"
  }
}

resource "aws_security_group" "samplegroup" {
  name        = "samplegroup"
  description = "allow sample traffic"

 ingress = [
    {
      description      = "TLS from VPC"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/16"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups = []
      self             = false
    }
  ]

  egress = [
    {
      description      = "egress"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups = []
      self             = false
    }
  ]
}

