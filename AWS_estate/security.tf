// Security.tf
/*
File is used for creation of security groups to
ensure a secure enviroment for our project!
*/


// defining security group for application load balancer (ALB)

resource "aws_security_group" "alb_sg" {
    name        = "real-estate-alb-sg"
    description = "Security group for the Application Load Balancer"
    vpc_id      = aws_vpc.main.id

    tags = {
        Name = "RealEstate-ALB-SG"
    }
}

// define security groups for web servers (EC2)
resource "aws_security_group" "web_sg" {
    name        = "real-estate-web-sg"
    description = "Security group for the web server EC2 instances"
    vpc_id      = aws_vpc.main.id

    tags= {
        Name = "RealEstate-Web-SG"
    }
}

//define security groups for RDS db
resource "aws_security_group" "rds_sg" {
    name        = "real-estate-rds-sg"
    description = "Security group for the RDS database instance"
    vpc_id      = aws_vpc.main.id

    tags = {
        Name = "RealEstate-RDS-SG"
    }
}

