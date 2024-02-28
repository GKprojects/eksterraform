# Define the VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
}

# Define public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnet_cidr_block #"10.0.0.0/18"
  availability_zone       = "us-east-2a"  # Update with desired AZ
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet"
  }
}

# Define private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_subnet_second_cidr_block
  availability_zone =  "us-east-2b"  # Update with desired AZ

  tags = {
    Name = "Private Subnet"
  }
}
#Second private subnet
resource "aws_subnet" "private_subnet_second" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_subnet_second_cidr_block
  availability_zone = "us-east-2c"  # Update with desired AZ

  tags = {
    Name = "Private Subnet second"
  }
}
# Create an internet gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "My IGW"
  }
}
# Create private route table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "Private Route Table"
  }
}
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "Public Route Table"
  }
}
resource "aws_route_table" "private_route_table_second" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "Second Private Route Table"
  }
}
# Associate public subnet with public route table
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}


# Associate private subnet with private route table
resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}

# Associate private subnet with private route table
resource "aws_route_table_association" "private_subnet_association_second" {
  subnet_id      = aws_subnet.private_subnet_second.id
  route_table_id = aws_route_table.private_route_table_second.id
}






