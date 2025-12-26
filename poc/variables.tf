variable "region" {
  default     = "us-east-1"
  description = "Region where AWS resources will be created"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "AWS VPC CIDR"
}
