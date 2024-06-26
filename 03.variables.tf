variable "ami" {
  type        = string
  description = "AMI of instance"
  default     = "ami-0705384c0b33c194c"
}
variable "instance_type" {
  description = "type of instance used"
  type        = string
  default     = "t3.nano"
}
