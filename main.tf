# Call the EC2 module to create 3 instances with input variables
module "ec2_module" {
  source         = "./modules/ec2-instance"
  ami            = var.ami_id
  instance_type  = "t2.micro"
  instance_count = 3
}
