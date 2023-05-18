resource "aws_instance" "sampleinstance" {
  ami                     = "ami-0dcc1e21636832c5d"
  instance_type           = "t2.micro"
  vpc_security_group_ids  =  [var.SGID]

  tags = {
    Name = "sampleinstance"
  }
}

output  = "public_ip" {
  value = aws_instance.sampleinstance.public_ip
}
variable "SGID" {}
