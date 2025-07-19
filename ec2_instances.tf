##############################
# Task 1.1 - EC2s using `count`
# This was refactored in Task 3 to use a module
# Code kept for grading purposes but commented out to avoid duplicate EC2s
##############################

# Creates 3 identical EC2 instances using count
# resource "aws_instance" "web_server" {
#   count         = 3
#   ami           = var.ami_id
#   instance_type = "t2.micro"

#   tags = {
#     Name = "web-server-${count.index}"
#   }
# }
