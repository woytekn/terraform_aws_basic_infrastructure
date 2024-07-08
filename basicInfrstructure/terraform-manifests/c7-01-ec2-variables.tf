# EC2 Instance type
variable "instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t2.micro"
}

# EC2 Key Pair
variable "instance_keypair" {
  description = "value of the key pair"
  type = string
  default = "terraform-key"
}
