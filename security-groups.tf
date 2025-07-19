# Creates different security groups using for_each and port map
resource "aws_security_group" "sg_rules" {
  for_each = var.security_group_rules

  name        = each.key
  description = "Security group for ${each.key}"

  ingress {
    from_port   = each.value
    to_port     = each.value
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
