variable "vpc_id" {
  type        = string
}

variable "allowed_ssh_ip" {
  type        = string
}

variable "from_port_demand" {
  type = number
  default = 22
}

variable "to_port_demand" {
  type = number
  default = 22
}