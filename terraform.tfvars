vpc_cidr = "10.0.0.0/16"
vpc_name = "gcc-vpc-facial-vpc"

key_name = "your-key-name"

subnet_map = {
  "gcc-facial-mobile-app"              = "subnet-xxxxxxx"
  "production-2-Gcc-facialrekognition-env-1" = "subnet-xxxxxxx"
  "Appserver-Dashboard"                = "subnet-xxxxxxx"
  "Dashboard-DB server"                = "subnet-xxxxxxx"
  "Socialmedia-AppServer"             = "subnet-xxxxxxx"
  "cloned-v2-Gcc-facialrekognition-env-1" = "subnet-xxxxxxx"
  "Milvus-server"                      = "subnet-xxxxxxx"
  "Bitnami-Django-server"              = "subnet-xxxxxxx"
}

sg_map = {
  "gcc-facial-mobile-app"              = ["sg-xxxxxxx"]
  "production-2-Gcc-facialrekognition-env-1" = ["sg-xxxxxxx"]
  "Appserver-Dashboard"                = ["sg-xxxxxxx"]
  "Dashboard-DB server"                = ["sg-xxxxxxx"]
  "Socialmedia-AppServer"             = ["sg-xxxxxxx"]
  "cloned-v2-Gcc-facialrekognition-env-1" = ["sg-xxxxxxx"]
  "Milvus-server"                      = ["sg-xxxxxxx"]
  "Bitnami-Django-server"              = ["sg-xxxxxxx"]
}

ec2_instances = {
  "gcc-facial-mobile-app" = {
    ami           = "ami-0522ab6e1ddcc7055"
    instance_type = "m6a.xlarge"
    root_volume   = 700
  }

  "production-2-Gcc-facialrekognition-env-1" = {
    ami           = "ami-08294e9724c2538f8"
    instance_type = "m6a.xlarge"
    root_volume   = 25
  }

  "Appserver-Dashboard" = {
    ami           = "ami-0522ab6e1ddcc7055"
    instance_type = "t3a.large"
    root_volume   = 25
  }

  "Dashboard-DB server" = {
    ami           = "ami-0522ab6e1ddcc7055"
    instance_type = "t3a.xlarge"
    root_volume   = 100
  }

  "Socialmedia-AppServer" = {
    ami           = "ami-0eb100f6ae3e7da06"
    instance_type = "t3.large"
    root_volume   = 80
    ebs_volume    = 120
  }

  "cloned-v2-Gcc-facialrekognition-env-1" = {
    ami           = "ami-08294e9724c2538f8"
    instance_type = "t3.micro"
    root_volume   = 25
  }

  "Milvus-server" = {
    ami           = "ami-00bb6a80f01f03502"
    instance_type = "t2.medium"
    root_volume   = 50
  }

  "Bitnami-Django-server" = {
    ami           = "ami-0438d181509e40995"
    instance_type = "m6a.large"
    root_volume   = 50
  }
}
security_groups = {
  "Bitnami-Django-server" = {
    description = "SG for Bitnami Django Server"
    vpc_id      = "vpc-xxxxxxxx"
    ingress = [
      { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 5432, to_port = 5432, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 80,   to_port = 80,   protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 443,  to_port = 443,  protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 22,   to_port = 22,   protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    ]
  }

  "gcc-facial-mobile-app" = {
    description = "SG for GCC Facial Mobile App"
    vpc_id      = "vpc-xxxxxxxx"
    ingress = [
      { from_port = 80,   to_port = 80,   protocol = "tcp", security_groups = ["sg-02d70202091d54281"] },
      { from_port = 8067, to_port = 8067, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 8081, to_port = 8081, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 8064, to_port = 8064, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 8075, to_port = 8075, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 443,  to_port = 443,  protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 22,   to_port = 22,   protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 0,    to_port = 65535, protocol = "-1", cidr_blocks = ["13.235.196.196/32"] }
    ]
  }

  "production-2-Gcc-facialrekognition-env-1" = {
    description = "SG for Rekognition Production"
    vpc_id      = "vpc-xxxxxxxx"
    ingress = [
      { from_port = 22,   to_port = 22,   protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 80,   to_port = 80,   protocol = "tcp", security_groups = ["sg-098fd46ed398c094b"] },
      { from_port = 3306, to_port = 3306, protocol = "tcp", security_groups = ["sg-0198769af7a1e9548"] },
      { from_port = 0,    to_port = 65535, protocol = "-1", security_groups = ["sg-03ca4c587c4b3ce65"] }
    ]
  }

  "Appserver-Dashboard" = {
    description = "SG for Appserver Dashboard"
    vpc_id      = "vpc-xxxxxxxx"
    ingress = [
      { from_port = 80,   to_port = 80,   protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 443,  to_port = 443,  protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 22,   to_port = 22,   protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    ]
  }

  "Dashboard-DB server" = {
    description = "SG for Dashboard DB Server"
    vpc_id      = "vpc-xxxxxxxx"
    ingress = [
      { from_port = 5432, to_port = 5432, protocol = "tcp", security_groups = ["sg-0a8b623e98e40f13e"] },
      { from_port = 22,   to_port = 22,   protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    ]
  }

  "Socialmedia-AppServer" = {
    description = "SG for Social Media App Server"
    vpc_id      = "vpc-xxxxxxxx"
    ingress = [
      { from_port = 80,   to_port = 80,   protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 443,  to_port = 443,  protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 22,   to_port = 22,   protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 0,    to_port = 65535, protocol = "-1", security_groups = ["sg-0126a8f90522e478e"] }
    ]
  }

  "cloned-v2-Gcc-facialrekognition-env-1" = {
    description = "SG for Cloned Rekognition Env"
    vpc_id      = "vpc-xxxxxxxx"
    ingress = [
      { from_port = 22,   to_port = 22,   protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 80,   to_port = 80,   protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 443,  to_port = 443,  protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 3306, to_port = 3306, protocol = "tcp", security_groups = ["sg-098fd46ed398c094b"] }
    ]
  }

  "Milvus-server" = {
    description = "SG for Milvus Server"
    vpc_id      = "vpc-xxxxxxxx"
    ingress = [
      { from_port = 22,   to_port = 22,   protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 80,   to_port = 80,   protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 443,  to_port = 443,  protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 19530, to_port = 19530, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 19121, to_port = 19121, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }
}
vpc_cidr                  = "10.0.0.0/16"
vpc_name                  = "gcc-vpc-facial-vpc"
public_subnet_1_cidr      = "10.0.0.0/20"
public_subnet_1_name      = "gcc-vpc-facial-subnet-public1-ap-south-1a"
public_subnet_2_cidr      = "10.0.16.0/20"
public_subnet_2_name      = "gcc-vpc-facial-subnet-public2-ap-south-1b"
private_subnet_1_cidr     = "10.0.128.0/20"
private_subnet_1_name     = "gcc-vpc-facial-subnet-private1-ap-south-1a"
private_subnet_2_cidr     = "10.0.144.0/20"
private_subnet_2_name     = "gcc-vpc-facial-subnet-private2-ap-south-1b"
public_route_table_name   = "gcc-vpc-facial-rtb-public"
private_route_table_1_name = "gcc-vpc-facial-rtb-private1-ap-south-1a"
private_route_table_2_name = "gcc-vpc-facial-rtb-private2-ap-south-1b"
igw_name                  = "gcc-vpc-facial-igw"
nat_gateway_name          = "gcc-vpc-facial-nat-public1-ap-south-1a"
