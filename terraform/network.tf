resource "aws_vpc" "vorx-vpc-prod" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Vorx-vpc-PROD"
  }
}

resource "aws_subnet" "vorx-subnet-public-1a" {
  vpc_id            = aws_vpc.vorx-vpc-prod.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "prod-vorx-subnet-publica-1a"
  }
}

resource "aws_subnet" "vorx-subnet-public-1b" {
  vpc_id            = aws_vpc.vorx-vpc-prod.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "prod-vorx-subnet-publica-1b"
  }
}


resource "aws_subnet" "vorx-subnet-private-1a" {
  vpc_id            = aws_vpc.vorx-vpc-prod.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "prod-vorx-subnet-private-1a"
  }
}

resource "aws_subnet" "vorx-subnet-private-1b" {
  vpc_id            = aws_vpc.vorx-vpc-prod.id
  cidr_block        = "10.0.20.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "prod-vorx-subnet-private-1b"
  }
}

resource "aws_internet_gateway" "vorx-vpc-prod-internet-gateway" {
  vpc_id = aws_vpc.vorx-vpc-prod.id

  tags = {
    Name = "prod-vorx-vpc-internet-gateway"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vorx-vpc-prod.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vorx-vpc-prod-internet-gateway.id
  }

  tags = {
    Name = "prod-public-rt"
  }
}

resource "aws_route_table_association" "association-vorx-subnet-public-1a" {
  subnet_id      = aws_subnet.vorx-subnet-public-1a.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "association-vorx-subnet-public-1b" {
  subnet_id      = aws_subnet.vorx-subnet-public-1b.id
  route_table_id = aws_route_table.public-rt.id
}


resource "aws_route_table" "vorx-private-rt-1a" {
  vpc_id = aws_vpc.vorx-vpc-prod.id

  tags = {
    Name = "prod-private-rt-1a"
  }
}

resource "aws_route_table" "vorx-private-rt-1b" {
  vpc_id = aws_vpc.vorx-vpc-prod.id

  tags = {
    Name = "prod-private-rt-1b"
  }
}

resource "aws_route_table_association" "association-vorx-private-rt-1a" {
  subnet_id      = aws_subnet.vorx-subnet-private-1a.id
  route_table_id = aws_route_table.vorx-private-rt-1a.id
}

resource "aws_route_table_association" "association-vorx-private-rt-1b" {
  subnet_id      = aws_subnet.vorx-subnet-private-1b.id
  route_table_id = aws_route_table.vorx-private-rt-1b.id
}
