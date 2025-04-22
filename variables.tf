variable "key_name" {
  description = "Key pair name to use for instances"
  type        = string
}

variable "subnet_map" {
  description = "Map of instance names to subnet IDs"
  type        = map(string)
}

variable "sg_map" {
  description = "Map of instance names to security group IDs"
  type        = map(list(string))
}

variable "ec2_instances" {
  description = "Map of EC2 instance definitions"
  type = map(object({
    ami           = string
    instance_type = string
    root_volume   = number
    ebs_volume    = optional(number)
  }))
}
