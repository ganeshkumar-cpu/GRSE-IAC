variable "security_groups" {
  description = "Map of security groups with ingress rules"
  type = map(object({
    description = string
    vpc_id      = string
    ingress     = list(object({
      from_port       = number
      to_port         = number
      protocol        = string
      cidr_blocks     = optional(list(string))
      security_groups = optional(list(string))
      description     = optional(string)
    }))
  }))
}
