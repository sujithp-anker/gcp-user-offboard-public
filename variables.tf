variable "Users_To_Offboard" {
  type        = string
  description = "Enter GCP user emails (e.g., user1@ankercloud.com, user2@ankercloud.com)"
  default     = ""
}

locals {
  user_list = var.Users_To_Offboard == "" ? [] : [
    for u in split(",", var.Users_To_Offboard) : trimspace(u)
  ]
}

variable "url" {
    type = string
    default = ""
    description = "Enter the Cloud Run Function URL."
  
}