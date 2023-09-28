variable "AWS_ACCESS_KEY" {
    type = string
    default = ""
}

variable "AWS_SECRET_KEY" {
  type = string
  default = ""
}

variable "AWS_REGION" {
default = "us-east-1"
}

variable "AMIS" {
    type = map
    default = {
        us-east-1 = "ami-0261755bbcb8c4a84"
        us-east-2 = "ami-05692172625678b4e"
        us-west-2 = "ami-0352d5a37fb4f603f"
        us-west-1 = "ami-0f40c8f97004632f9"
    }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "realtechie_key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "realtechie_key.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}