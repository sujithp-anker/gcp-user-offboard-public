variable "Users_To_Offboard" {
  type        = string
  description = "Enter GCP user emails (e.g., user1@ankercloud.com, user2@ankercloud.com)"
  default     = ""
}

variable "CloudFunctionURL" {
    type = string
    default = ""
    description = "Enter the Cloud Run Function URL."
  
}

locals {
  user_list = var.Users_To_Offboard == "" ? [] : [
    for u in split(",", var.Users_To_Offboard) : trimspace(u)
  ]
}