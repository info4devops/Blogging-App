variable "ssh_key_name" {
  description = "The name of the SSH key pair to use for instances"
  type        = string
  default     = "Blog-Key" # Replace with ur Terraform instance key-pair name
}
