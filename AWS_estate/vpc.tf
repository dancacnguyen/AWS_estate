# Define your VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "main-vpc"
  }
}

# Define your subnet (this is where your instance will go)
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "main-subnet"
  }
}

# Define an Internet Gateway for internet access
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

# Define a Route Table to connect the subnet to the Internet Gateway
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

# Associate the subnet with the route table
resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main.id
}

# Define a Security Group to allow HTTP traffic
resource "aws_security_group" "web_server_sg" {
  name        = "web-server-sg"
  description = "Allow HTTP inbound traffic"
  # Reference the VPC by its ID here
  vpc_id      = aws_vpc.main.id

  # Allow inbound HTTP traffic on port 80 from anywhere
  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web Server Security Group"
  }
}

# Define the EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-00142eb1747a493d9"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.main.id
  associate_public_ip_address = true

  # Attach the security group to the instance
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]

  user_data = <<-EOF
  #!/bin/bash
  echo "Starting user data script..."
  dnf install -y httpd > /tmp/dnf_install.log 2>&1
  echo "dnf install command exited with code $?"
  systemctl start httpd > /tmp/systemctl_start.log 2>&1
  echo "systemctl start command exited with code $?"
  systemctl enable httpd > /tmp/systemctl_enable.log 2>&1
  echo "systemctl enable command exited with code $?"
  echo '<h1>Hey Tony, Happy birthday!</h1>' > /var/www/html/index.html
  eecho '<img src="https://media.discordapp.net/attachments/1118051002134839349/1410555214804549672/cuppong2_01_01_5207.jpg?ex=68d7042a&is=68d5b2aa&hm=e6a9ca9c7ca1398d067df04009964eb2754c503c0354ed5a219a22509d99ad63&=&format=webp&width=1406&height=791" alt="A screenshot of the Cuppong game." width="500" height="281">' >> /var/www/html/index.html
  echo "User data script finished."
  EOF

  tags = {
    Name = "SimpleWebServer"
  }
}

