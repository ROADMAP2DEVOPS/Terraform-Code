variable "AWS_ACCESS_KEY" {
    type = string
    default = ""
}

variable "AWS_SECRET_KEY" {
  type = string
  default = ""
}

variable "vpc_cidr" {
  type = string
  description = "cidr for vpc"
  default = ""
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_classiclink" {
  description = "Should be true to enable ClassicLink for the VPC. Only valid in regions and accounts that support EC2 Classic."
  type        = bool
  default     = null
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "environment" {
  description = "AWS VPC Environment Name"
  type        = string
  default     = ""
}

variable "realtechiePub-Sub1_cidr" {
  type = string
  default = ""
}

variable "realtechiePub-Sub2_cidr" {
  type = string
  default = ""
}

variable "realtechiePub-Sub3_cidr" {
  type = string
  default = ""
}

variable "realtechiePri-Sub1_cidr" {
  type = string
  default = ""
}

variable "realtechiePri-Sub2_cidr" {
  type = string
  default = ""
}

variable "realtechiePri-Sub3_cidr" {
  type = string
  default = ""
}

variable "project_name" {
  type = string
  default = ""
}


variable "AWS_REGION" {
default = "us-east-1"
}

