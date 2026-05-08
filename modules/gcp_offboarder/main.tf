data "google_client_config" "default" {}

data "http" "gcp_offboard" {
  url    = var.url
  method = "POST"
  request_headers = {
    "Content-Type"  = "application/json"
    "Authorization" = "Bearer ${data.google_client_config.default.access_token}"
  }
  request_body = jsonencode({ username = var.username })
}

output "gcp_report" {
  value = jsondecode(data.http.gcp_offboard.response_body)
}