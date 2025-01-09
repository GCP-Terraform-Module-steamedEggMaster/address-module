output "address_name" {
  description = "생성된 IP 주소의 이름"
  value       = module.external_ip.address_name
}

output "ip_address" {
  description = "생성된 IP 주소"
  value       = module.external_ip.address
}

output "ip_self_link" {
  description = "IP 주소의 self_link"
  value       = module.external_ip.self_link
}