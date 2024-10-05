variable "ami" {
  description = "AMI ID for EC2"
  type        = string
}

variable "instance_type" {
  description = "Instance Type"
  type        = string
  default     = "t2.micro"
}

variable "public_subnet_ids" {
  description = "List of Public Subnet IDs"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of Private Subnet IDs"
  type        = list(string)
}

variable "public_security_group_id" {
  description = "Security Group ID for Public instance"
  type        = string
}

variable "private_security_group_id" {
  description = "Security Group ID for Private instance"
  type        = string
}

variable "key_name" {
  type = string
  default = "default"
}

variable "public_key" {
  type = string
}
