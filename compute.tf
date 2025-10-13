#Obtaining the Ami from aws

data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"] 
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

# ami = = data.aws_ami.latest_amazon_linux.id

#Looking for Key

resource "aws_key_pair" "web_access_key" {
  key_name   = "webserver-key" # This is the NAME you will use in your aws_instance resource
  public_key = file("webserver-key.pub") 
}

# key_name = aws_key_pair.deployer_key.key_name





resource "aws_instance" "app_server" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = "t3.micro"  
   key_name      = aws_key_pair.web_access_key.key_name

  # 1. Use an ID from the public subnets 
  # (assuming 'public' is a list and you want the first one, or adjust if using 'for_each')
  subnet_id = aws_subnet.public[0].id 

  # 2. Use the Web Server Security Group ID
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  # Enables the instance to receive a public IP (since it's in a public subnet)
  associate_public_ip_address = true 

  tags = {
    Name = "Web-Server-01"
  }
}









