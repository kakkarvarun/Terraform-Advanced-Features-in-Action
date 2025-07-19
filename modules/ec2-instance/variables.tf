variable "ami" {
  description = "AMI ID for EC2"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
}
