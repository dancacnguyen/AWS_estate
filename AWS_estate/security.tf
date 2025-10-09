// Security.tf
/*
File is used for creation of security groups to
ensure a secure enviroment for our project!

-opting for inline definition of ingress/egress rules to keep simplier visually**

-defining security group for application load balancer (ALB)
*/



resource "aws_security_group" "alb_sg" {
    name        = "real-estate-alb-sg"
    description = "Security group for the Application Load Balancer"
    vpc_id      = aws_vpc.main.id
    
    //Ingress rules: allow web traffic from anywhere
    ingress {
        description = "Allow HTTP from anywhere"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Allow HTTPS from anywhere"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "RealEstate-ALB-SG"
    }
}


// define security groups for web servers (EC2)
resource "aws_security_group" "web_sg" {
    name        = "real-estate-web-sg"
    description = "Security group for the web server EC2 instances"
    vpc_id      = aws_vpc.main.id

    // Ingress rule: allow traffic only from the ALB's security group
    ingress {
        description     = "Allow web traffic from the ALB"
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        security_groups = [aws_security_group.alb_sg.id] // source is the ALB sec group
    }

    // Egress rule: allow all outbound traffic
    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags= {
        Name = "RealEstate-Web-SG"
    }
}


//define security groups for RDS db
resource "aws_security_group" "rds_sg" {
    name        = "real-estate-rds-sg"
    description = "Security group for the RDS database instance"
    vpc_id      = aws_vpc.main.id

    // Egress rule: allow all outbound traffic
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "RealEstate-RDS-SG"
    }
}

