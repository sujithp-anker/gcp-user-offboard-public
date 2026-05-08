output "gcp_offboarding_audit_report" {
  description = "Detailed report of access removal across Projects and Billing Accounts"
  value = {
    for user in local.user_list : user => module.gcp_offboarder[user].gcp_report
  }
}