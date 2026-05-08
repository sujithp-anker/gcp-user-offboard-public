# Use the OIDC token instead of the client config token
data "google_service_account_id_token" "oidc" {
  target_service_account = var.sa
  target_audience        = var.url
}

data "http" "gcp_offboard" {
  url    = var.url
  method = "POST"
  request_headers = {
    "Content-Type"  = "application/json"
    # Use the .id_token attribute here
    "Authorization" = "Bearer ${data.google_service_account_id_token.oidc.id_token}"
  }
  request_body = jsonencode({ username = var.username })
}

output "gcp_report" {
  # Add a try() block so your plan doesn't crash if the function has a hiccup
  value = try(jsondecode(data.http.gcp_offboard.response_body), data.http.gcp_offboard.response_body)
}