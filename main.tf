module "gcp_offboarder" {
  source   = "./modules/gcp_offboarder"
  for_each = toset(local.user_list)
  url = var.url
  username = each.value
}