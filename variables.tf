# AMI ID to be used for EC2 instances
variable "ami_id" {
  description = "AMI ID for EC2"
  default     = "ami-0150ccaf51ab55a51" # Update this for region
}

# Used in for_each to create multiple security groups
variable "security_group_rules" {
  default = {
    "web-sg" = 80,
    "ssh-sg" = 22,
    "app-sg" = 8080
  }
}
