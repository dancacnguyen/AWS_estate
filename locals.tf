locals {
    region = "us-east-1"
    vpc_cidr = "10.0.0.0/16"
    env = "dev" 

    azs = ["us-east-1a", "us-east-1b"]
    public_subnets = ["10.0.0.0/19", "10.0.32.0/19"]
    
    private_subnets = {
        public_1 = {
            cidr = cidrsubnet(local.vpc_cidr, 3, 2)
            az = "us-east-1a"
        }
        public_2 = {
            cidr = cidrsubnet(local.vpc_cidr, 3, 3)
            az = "us-east-1b"
        }
    }

    create_isolated_subnets = false
    #this is the value that decides whether or not we want an isolated subnet. I left it as false for now
}



