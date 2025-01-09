output "ip_id" {
  description = "모듈에서 생성된 IP 주소 리소스의 고유 식별자 (ID)"
  value       = module.external_ip.id
}

output "ip_address" {
  description = "모듈에서 생성된 IP 주소 (고정 또는 동적)"
  value       = module.external_ip.address
}

output "ip_self_link" {
  description = "모듈에서 생성된 IP 주소 리소스의 고유 URI (Self Link)"
  value       = module.external_ip.self_link
}