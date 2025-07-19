#  Outputs instance IDs from count loop
output "web_instance_ids" {
  value = module.ec2_module.instance_ids
}
