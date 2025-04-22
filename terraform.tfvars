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
