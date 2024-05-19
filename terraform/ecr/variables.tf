variable "region" {
  description = "The AWS region to deploy into"
  type        = string
  default     = "ap-south-1"
}

variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  sensitive   = true
}

variable "ecr_repositories" {
  description = "List of ECR repositories to create"
  type        = list(string)
  default     = ["haalsamachar-graphql", "haalsamachar-users", "haalsamachar-blogs", "haalsamachar-auth", "haalsamachar-comments", "haalsamachar-frontend"]
}
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}