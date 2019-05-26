variable "project_name" {
  type        = "string"
  description = "Nome do projeto"
  default     = "Webserver"
}

variable "instance_tags" {
  type        = "map"
  description = "Tags a serem aplicadas à nossa instância."

  default = {
    "Name"     = "webserver-1"
    "Ambiente" = "Desenvolvimento"
    "Projeto"  = "Webserver"
  }
}

variable "user_data" {
  type        = "string"
  description = "Script a ser executado durante a criação da instância."

  default = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install apache2 -y
              sudo systemctl enable apache2
              sudo systemctl start apache2
              sudo ufw allow 'Apache'
              EOF
}

variable "i_from_port" {
  type        = "string"
  description = "Ingress Origin port to receive connections."
  default     = "80"
}

variable "i_to_port" {
  type        = "string"
  description = "Ingress Destination port to pass connections to."
  default     = "80"
}

variable "i_ip_range" {
  type        = "list"
  description = "Ingress Ip range that will be able to connect to this server."
  default     = ["0.0.0.0/0"]
}

variable "e_from_port" {
  type        = "string"
  description = "Egress Origin port to receive connections from."
  default     = "0"
}

variable "e_to_port" {
  type        = "string"
  description = "Destination port to pass connections to."
  default     = "0"
}

variable "e_ip_range" {
  type        = "list"
  description = "Ip range that will be able to connect to this server."
  default     = ["0.0.0.0/0"]
}

variable "vpc_ip_range" {
  type        = "string"
  description = "Range de IPs para a VPC"
  default     = "11.0.0.0/16"
}

variable "gw_tags" {
  type        = "map"
  description = "Tags a serem aplicadas ao gateway de internet"

  default = {
    "Name" = "dev-webserver-gw"
  }
}

variable "route_ips" {
  type        = "string"
  description = "Range de IPs a serem aplicados na route table"
  default     = "0.0.0.0/0"
}

variable "route_tags" {
  type        = "map"
  description = "Tags a serem aplicadas na route table"

  default = {
    "Name" = "dev-webserver-route-table"
  }
}

variable "sg_tags" {
  type        = "map"
  description = "Tags a serem aplicadas no security group"

  default = {
    "Name" = "dev-webserver-sg"
  }
}

variable "vpc_tags" {
  type        = "map"
  description = "Tags a serem aplicadas a vpc"

  default = {
    "Name" = "dev-webserver-vpc"
  }
}

variable "subnet_tags" {
  type        = "map"
  description = "Tags a serem aplicadas a subnet"

  default = {
    "Name" = "dev-webserver-subnet"
  }
}
