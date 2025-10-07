// Security.tf
/*
File is used for creation of security groups to
ensure a secure enviroment for our project!
*/


// defining security group for application load balancer

resource "aws_security_group" "alb_sg" {
    name        = "real-estate-alb-sg"
    description = "Security group for the Application Load Balancer"
    vpc_id      = aws_vpc.main.id

    tags = {
        Name = "RealEstate-ALB-SG"
    }
}