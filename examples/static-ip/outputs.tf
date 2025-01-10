output "static_ip_details" {
  description = "생성된 Static IP의 세부 정보"
  value = {
    id                 = module.static_ip.id
    name               = module.static_ip.name
    address            = module.static_ip.address
    address_type       = module.static_ip.address_type
    self_link          = module.static_ip.self_link
    creation_timestamp = module.static_ip.creation_timestamp
    region             = module.static_ip.region
    network            = module.static_ip.network
    subnetwork         = module.static_ip.subnetwork
    users              = module.static_ip.users
  }
}