variable "ec2_instances" {
  type = map(object({
    ami           = string
    instance_type = string
    root_volume   = number
    ebs_volume    = optional(number)
  }))
}

variable "key_name" {
  type = string
}

variable "subnet_map" {
  type = map(string)
}

variable "sg_map" {
  type = map(list(string))
}
