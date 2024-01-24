variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}
variable "ami" {
  description = "Amazon Machine Image (AMI) ID"
  default     = "ami-086cae3329a3f7d75"  # Replace with your desired AMI ID
}