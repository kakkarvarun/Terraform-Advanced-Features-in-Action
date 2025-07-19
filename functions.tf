# Demonstrates usage of different function types

output "string_upper" {
  value = upper("practical lab 8")
}

output "numeric_max" {
  value = max(3, 8, 2)
}

output "collection_length" {
  value = length(["a", "b", "c"])
}

output "datetime_example" {
  value = formatdate("YYYY-MM-DD", timestamp())
}

output "cidr_example" {
  value = cidrsubnet("10.0.0.0/16", 8, 1)
}
