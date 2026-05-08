variable "Users_To_Offboard" {
  type        = string
  description = "Enter GCP user emails (e.g., user1@ankercloud.com, user2@ankercloud.com)"
  default     = ""
}

locals {
  # Clean up the string: split by comma, remove whitespace, filter empty strings
  user_list = var.Users_To_Offboard == "" ? [] : [
    for u in split(",", var.Users_To_Offboard) : trimspace(u)
  ]
}