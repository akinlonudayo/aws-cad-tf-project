resource "aws_vpc" "customVPC" {
  cidr_block       = var.customCIDR
  instance_tenancy = "default"

  tags = {
    Name = "customVPC"
  }
}

resource "aws_internet_gateway" "internetGW" {
  vpc_id = aws_vpc.customVPC.id

  tags = {
    Name = "internetGW"
  }
}

resource "aws_route_table" "routeTable" {
  vpc_id = aws_vpc.customVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internetGW.id
  }

  tags = {
    Name = "routeTable"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.customVPC.id
  cidr_block              = var.subnet1_cidr
  availability_zone       = var.AZ1
  map_public_ip_on_launch = true

  tags = {
    Name = "Subnet1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id            = aws_vpc.customVPC.id
  cidr_block        = var.subnet2_cidr
  availability_zone = var.AZ1

  tags = {
    Name = "Subnet2"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id                  = aws_vpc.customVPC.id
  cidr_block              = var.subnet3_cidr
  availability_zone       = var.AZ2
  map_public_ip_on_launch = true

  tags = {
    Name = "Subnet3"
  }
}

resource "aws_subnet" "subnet4" {
  vpc_id            = aws_vpc.customVPC.id
  cidr_block        = var.subnet4_cidr
  availability_zone = var.AZ2

  tags = {
    Name = "Subnet4"
  }
}

resource "aws_route_table_association" "subnet1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.routeTable.id
}

resource "aws_route_table_association" "subnet3" {
  subnet_id      = aws_subnet.subnet3.id
  route_table_id = aws_route_table.routeTable.id
}

resource "aws_security_group" "PublicEC2SG" {
  name        = "CustomPublicEC2SGTerraform"
  description = "Allow inbound traffic on 22, 80 and all outbound traffic"
  vpc_id      = aws_vpc.customVPC.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "PublicALBSG" {
  name        = "CustomPublicALBSGTerraform"
  description = "Allow inbound traffic on 80, 443 and all outbound traffic"
  vpc_id      = aws_vpc.customVPC.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "EC2Instance" {
  ami                    = var.AMI_ID
  instance_type          = var.InstanceType
  subnet_id              = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.PublicEC2SG.id]

  tags = {
    Name = "EC2Instance"
  }
}


