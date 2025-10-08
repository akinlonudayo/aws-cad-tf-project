resource "aws_instance" "EC2Instance" {
  ami                    = var.AMI_ID
  instance_type          = var.InstanceType
  subnet_id              = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.PublicEC2SG.id]

  tags = {
    Name = "EC2Instance"
  }
}
